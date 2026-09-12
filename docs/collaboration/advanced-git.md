---
sidebar_position: 1
sidebar_label: 28. Git 추가 기능
title: Git 추가 기능
description: Blame, Cherry-pick, Fork를 상황에 맞게 사용하는 방법
tags: [git, github, collaboration]
---

# Git 추가 기능

> **중요도: 참고** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 28. Git에서 알아두면 좋은 추가 기능

### Blame

특정 코드 줄이 **언제, 어떤 Commit에서 변경되었는지** 확인한다.

이름 때문에:

```text
"누구 잘못인지 찾는 기능"
```

처럼 보일 수 있지만 실제 목적은 보통:

```text
"이 코드가 왜 이렇게 되었는지 History를 추적"
```

하는 것이다.

---

### Cherry-pick

특정 Commit 하나만 골라 다른 Branch에 적용한다.

```text
Branch A

Commit A
Commit B
Commit C

Commit C만 Branch B에 적용
→ cherry-pick
```

자주 사용할 필요는 없지만 알아두면 유용하다.

---

### Fork

다른 Repository를 내 GitHub 계정 쪽에 독립적인 Repository로 만들어 작업하는 방식.

팀 내부 Collaborator 방식에서는 자주 쓰지 않을 수 있지만 Open Source에서는 흔하다.

```text
Clone
= Repository를 내 PC로 가져오기

Fork
= Repository를 내 GitHub 계정 쪽으로 가져오기
```

---
