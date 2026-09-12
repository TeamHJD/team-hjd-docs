---
sidebar_position: 1
sidebar_label: 15–20. PR·리뷰·Merge
title: Pull Request, 리뷰와 Merge
description: PR 작성부터 리뷰, Branch 보호 규칙까지의 협업 기준
tags: [git, github, collaboration]
---

import pullRequestImage from '@site/static/img/guide/guide-02-pull-request.png';

# Pull Request, 리뷰와 Merge

> **중요도: 중요** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 15. Pull Request

Pull Request, 줄여서 **PR**은 이번 프로젝트에서 가장 중요한 협업 기능 중 하나다.

<figure className="guide-screenshot">
  <img src={pullRequestImage} alt="GitHub Pull Request에서 변경 요약과 관련 이슈, 작업 범위를 확인하는 화면" />
  <figcaption>PR 설명에 변경 요약, 관련 Issue, 작업 범위를 남기는 예시</figcaption>
</figure>

단순히:

```text
"제 Branch를 main에 합쳐주세요."
```

가 아니다.

보다 정확하게는:

```text
"제가 이런 변경을 했습니다.
Shared Branch에 들어가기 전에 함께 확인하고 이야기해 주세요."
```

에 가깝다.

### PR에서 주로 확인하는 것

- Title
- Description
- Related Issue
- Reviewer
- Commits
- Files Changed
- Conversation
- Checks
- Review Status

---

### Draft PR

아직 Merge할 준비는 되지 않았지만 작업 방향이나 진행 상황을 공유하고 싶을 때 사용할 수 있다.

예:

```text
구조를 크게 바꾸고 있어서
완성 전에 의견을 받고 싶다.
```

이런 경우 유용하다.

---

## 16. Issue와 PR 연결

PR 본문에서 다음처럼 작성할 수 있다.

```text
Closes #32
```

또는:

```text
Fixes #32
Resolves #32
```

해당 PR이 Merge되면 연결된 Issue를 자동으로 Close할 수 있다.

그래서 다음과 같은 추적 가능한 흐름이 만들어진다.

```text
Issue #32
↓
Branch
↓
Pull Request
↓
Review
↓
Merge
↓
Issue Close
```

이런 연결을 잘 사용하면 나중에

```text
"이 코드는 왜 추가됐지?"
```

라는 질문에서 PR과 Issue까지 거슬러 올라갈 수 있다.

---

## 17. Code Review

Code Review의 목적은 단순히 **틀린 코드 찾기**가 아니다.

다음과 같은 목적이 있다.

- Bug 조기 발견
- Readability 개선
- Code Quality 개선
- Architecture 공유
- Knowledge Sharing
- 다른 팀원의 코드 학습
- Regression 방지
- 프로젝트 전체 구조 이해

특히 이번 프로젝트에서는 **Code Review 자체도 공부의 일부**로 본다.

---

### Reviewer가 볼 수 있는 것

#### Correctness

의도대로 동작하는가?

#### Readability

다른 사람이 읽고 이해하기 쉬운가?

#### Naming

Class, Method, Variable 이름이 역할을 잘 표현하는가?

#### Responsibility

한 Class나 Method가 너무 많은 역할을 맡고 있지 않은가?

#### Coupling

다른 System과 지나치게 강하게 연결되어 있지 않은가?

#### Duplication

같은 로직이 불필요하게 반복되고 있지 않은가?

#### Edge Case

평소에는 드러나지 않는 경계 상황에서 문제가 발생하지 않는가?

#### Regression

새 변경으로 기존 기능이 망가지지 않는가?

#### Unity Asset Change

의도하지 않은 Scene, Prefab, `.meta` 변경이 섞여 있지 않은가?

---

### Review 결과

GitHub Review에서는 보통 다음 중 하나를 선택할 수 있다.

#### Comment

의견만 남긴다.

#### Approve

현재 변경 사항을 Merge해도 괜찮다고 판단한다.

#### Request Changes

Merge 전에 수정이 필요하다고 판단한다.

> [!NOTE]
> `Approve`는 "대충 봤음" 버튼이 아니다.
> 자신이 확인 가능한 범위에서 Shared Code에 들어가도 괜찮다고 판단했다는 의미로 사용한다.

---

### Review Comment 표현

팀에서 다음 정도를 구분해서 사용하면 편하다.

```text
[Must]
Merge 전 반드시 수정 또는 해결

[Suggestion]
개선 제안. 반드시 수정할 필요는 없음

[Question]
구현 의도나 구조에 대한 질문

[Nit]
Naming, Formatting 등 아주 작은 의견
```

---

### LGTM

**Looks Good To Me**

Review에서 자주 사용되는 표현이다.

다만 실제 코드를 확인하지 않고:

```text
LGTM
Approve
```

만 반복하는 방식은 지양한다.

---

## 18. Merge Strategy

GitHub에서는 PR을 합치는 방법이 여러 가지다.

### Merge Commit

Branch의 Commit History를 유지하면서 Merge Commit을 하나 추가한다.

---

### Squash and Merge

PR 안의 여러 Commit을 하나로 합쳐 main에 반영한다.

예:

```text
PR 내부

fix
fix2
review 반영
rename
final fix

↓ Squash

feat: implement player dash (#32)
```

우리 팀에서는 History를 깔끔하게 관리하기 위해 **Squash and Merge**를 기본으로 사용하는 것을 고려한다.

---

### Rebase and Merge

Commit의 기반을 재배치하여 History를 선형으로 유지한다.

초반에는 개념만 알아두어도 충분하다.

---

## 19. main과 Stable Branch

`main`은 가능한 한 항상 다음 상태를 유지하는 것을 목표로 한다.

```text
Build 가능
+
실행 가능
+
주요 기능 정상
```

그래서:

```text
main에서 직접 개발
```

보다는:

```text
Branch
↓
PR
↓
Review
↓
CI
↓
Merge
```

흐름을 사용한다.

---

## 20. Ruleset / Branch Protection

협업 규칙을 사람의 기억에만 맡기지 않고 GitHub가 강제하도록 만들 수 있다.

예:

```text
main Direct Push 제한

Pull Request 필수

최소 1 Approval 필요

Status Check 통과 필요
```

이렇게 설정하면 CI가 실패하거나 Review가 부족한 PR을 GitHub가 Merge하지 못하게 막을 수 있다.

> [!TIP]
> 좋은 협업 규칙은 "실수하지 마세요"라고 말하는 것보다 **실수하기 어려운 환경을 만드는 것**에 가깝다.

---
