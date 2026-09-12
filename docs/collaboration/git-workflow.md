---
sidebar_position: 1
sidebar_label: 05–11. Commit·Branch·복구
title: Commit, Branch, Merge와 복구
description: 변경 이력, 브랜치, 충돌 해결과 되돌리기
tags: [git, github, collaboration]
---

# Commit, Branch, Merge와 복구

> **중요도: 필수** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 5. Commit

### 좋은 Commit이란?

Commit 하나에는 가능한 한 **하나의 목적**이 들어가는 것이 좋다.

좋은 예:

```text
feat: add player dash input
fix: prevent turret targeting destroyed enemy
refactor: separate damage calculation
```

좋지 않은 예:

```text
수정
작업
최종
진짜최종
asdf
```

Commit Message만 봐도 어느 정도 변경 내용을 추측할 수 있어야 한다.

---

### Commit Hash

각 Commit에는 고유한 식별값이 존재한다.

예:

```text
a82f18c...
```

Git은 이 값을 이용해 특정 Commit을 정확히 가리킬 수 있다.

---

### History

Commit이 쌓여 만들어진 프로젝트의 변경 이력이다.

```bash
git log
```

---

### Diff

두 상태 사이에서 **무엇이 변경되었는지** 보여주는 차이다.

PR Code Review에서도 결국 Reviewer가 가장 많이 보는 것은 이 Diff다.

```text
기존 코드
- speed = 5;

변경 코드
+ speed = 8;
```

---

## 6. Branch

Branch는 다른 작업과 분리하여 개발할 수 있게 해주는 독립적인 작업 흐름이다.

```text
main
 │
 ├──── feat/player-dash
 │
 ├──── feat/turret-system
 │
 └──── fix/enemy-target
```

### 왜 Branch를 사용할까?

여러 명이 동시에 `main`을 직접 수정하면 서로의 코드가 계속 섞인다.

Branch를 사용하면:

- 각자 독립적으로 개발할 수 있고
- 작업이 끝난 뒤 검토할 수 있으며
- 문제가 있는 코드를 main에 바로 넣지 않을 수 있다.

우리 팀에서는 대략 다음 Prefix를 사용할 수 있다.

```text
feat/       새로운 기능
fix/        버그 수정
refactor/   코드 구조 개선
chore/      설정 및 기타 작업
docs/       문서
```

예:

```text
feat/player-dash
fix/turret-target
refactor/damage-system
```

---

## 7. HEAD

**HEAD**는 현재 내가 바라보고 있는 Commit을 가리키는 포인터라고 생각하면 된다.

일반적인 상황에서는 현재 Branch의 최신 Commit을 가리킨다.

```text
HEAD
 ↓
feat/player-dash
 ↓
Commit C
```

Git에서

```text
"현재 나는 어디에 있는가?"
```

를 나타내는 중요한 개념이다.

처음에는 이 정도만 이해해도 충분하다.

---

## 8. Merge

Merge는 서로 다른 Branch의 변경 사항을 하나로 합치는 작업이다.

```text
feat/player-dash
        ↓
      Merge
        ↓
       main
```

하지만 우리 팀에서는 기능 개발자가 마음대로 main에 바로 Merge하는 것이 아니라,

```text
Pull Request
→ Code Review
→ CI
→ Merge
```

과정을 거치는 것을 기본으로 한다.

---

## 9. Merge Conflict

Git이 두 변경 사항 중 어떤 것을 선택해야 할지 판단할 수 없을 때 발생한다.

예를 들어 두 사람이 같은 줄을 서로 다르게 수정했다고 생각해보자.

```text
A
speed = 10;

B
speed = 15;
```

Git은 어느 쪽이 맞는지 알 수 없다.

이때 Conflict가 발생한다.

```text
<<<<<<< HEAD
speed = 10;
=======
speed = 15;
>>>>>>> feat/player
```

이 의미는:

```text
"Git이 망가졌다"
```

가 아니라,

```text
"어떤 변경을 사용할지 사람이 결정해 주세요"
```

에 가깝다.

### Conflict Resolution

일반적인 흐름은:

```text
Conflict 확인
↓
올바른 코드 선택 또는 재작성
↓
Stage
↓
Merge 계속 진행
```

이다.

> [!WARNING]
> Unity에서는 C# 코드뿐 아니라 Scene, Prefab, ScriptableObject 같은 Asset에서도 Conflict가 발생할 수 있다.  
> 이런 파일은 사람이 읽기 어렵고 변경량도 커질 수 있어 **같은 Scene/Prefab을 동시에 수정하지 않는 운영 규칙**이 중요하다.

---

## 10. 변경을 되돌리는 방법

비슷해 보이지만 역할이 다르다.

### restore

현재 작업 파일의 변경 내용을 되돌릴 때 사용한다.

아직 Commit하지 않은 작업을 취소할 때 주로 사용한다.

---

### revert

기존 Commit을 삭제하는 대신, **그 Commit의 변경을 반대로 수행하는 새로운 Commit**을 만든다.

```text
Commit A
Commit B
Commit C
Commit C를 취소하는 Commit D
```

공유된 History를 보존하기 때문에 팀 Repository에서는 비교적 안전한 방법이다.

---

### reset

Branch가 가리키는 위치 자체를 이전 Commit으로 이동시킬 수 있다.

History를 바꿀 수 있기 때문에 사용 시 주의가 필요하다.

특히:

```bash
git reset --hard
```

는 작업 내용까지 사라질 수 있다.

> [!WARNING]
> 공유된 Branch의 History를 함부로 `reset`하고 Force Push하는 행동은 피한다.  
> 이미 다른 사람이 사용하고 있는 History를 바꾸면 협업이 크게 꼬일 수 있다.

---

## 11. Stash

아직 Commit하기 애매한 작업을 잠시 치워두고 싶을 때 사용한다.

예:

```text
Player 기능 개발 중
↓
급하게 main의 Bug를 확인해야 함
↓
git stash
↓
다른 Branch에서 작업
↓
원래 Branch 복귀
↓
git stash pop
```

```bash
git stash
git stash pop
```

> [!TIP]
> "Commit하기엔 애매한데 Branch는 바꿔야 한다"는 상황에서 유용하다.

---
