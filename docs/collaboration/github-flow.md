---
sidebar_position: 1
sidebar_label: 12–14. Issue와 작업 관리
title: Issue와 작업 관리
description: Issue, 작업 상태, GitHub Projects를 사용하는 방법
tags: [git, github, collaboration]
---

import issueCreateImage from '@site/static/img/guide/guide-01-github-issue.png';

# Issue와 작업 관리

> **중요도: 필수** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 12. GitHub Issue

Issue는 개발해야 할 작업, Bug, 개선 사항 등을 추적하는 기본 단위다.

<figure className="guide-screenshot">
  <img src={issueCreateImage} alt="GitHub Issue 생성 화면에서 작업 영역과 요구 사항을 작성하는 예시" />
  <figcaption>GitHub Issue 템플릿으로 작업 범위와 요구 사항을 빠뜨리지 않고 정리하는 예시</figcaption>
</figure>

예:

```text
[Player] Dash 기능 구현
[Bug] Turret이 제거된 Enemy를 계속 Targeting하는 문제
```

### 자주 쓰는 기능

#### Assignee

해당 Issue의 담당자.

#### Label

Issue의 종류나 성격을 표시한다.

예:

```text
feature
bug
refactor
documentation

priority: high
priority: medium
priority: low
```

#### Milestone

여러 Issue를 특정 목표에 묶을 때 사용한다.

예:

```text
Combat Prototype
Alpha
Demo Release
```

---

### Acceptance Criteria

**이 Issue를 완료했다고 판단할 조건**이다.

예:

```text
[Player] Dash 구현

Acceptance Criteria

- Dash Input이 동작한다.
- Cooldown이 적용된다.
- Wall Collision이 정상 동작한다.
- 기존 Movement에 Regression이 없다.
```

Acceptance Criteria가 있으면

```text
"이거 다 한 거 맞나요?"
```

라는 애매함이 줄어든다.

---

## 13. Task Management에서 자주 쓰는 용어

### Backlog

해야 할 가능성이 있지만 아직 이번 작업 주기에 들어오지 않은 Task 목록.

---

### Todo

가까운 시기에 실제로 진행하기로 결정한 Task.

---

### In Progress

현재 누군가 작업하고 있는 상태.

---

### Review

PR이 생성되어 Review를 기다리고 있거나 Review 중인 상태.

---

### Done

단순히 코딩이 끝난 상태가 아니다.

우리 팀에서는 기본적으로:

```text
Implementation
+
Self Test
+
Pull Request
+
Code Review
+
필수 수정
+
CI
+
Merge
=
Done
```

정도로 생각한다.

---

### Priority

작업 우선순위.

---

### Dependency

다른 Task나 System이 먼저 필요하거나 서로 의존하는 관계.

```text
Enemy Damage 구현
      ↑
Damage System 필요
```

---

### Blocker

작업 진행을 막고 있는 문제.

Blocker가 생겼다면 혼자 오래 끌기보다 빠르게 공유한다.

---

### Scope

현재 작업에서 **포함하는 범위**.

PR이나 Issue가 커질 때 특히 중요한 개념이다.

```text
"이 변경까지 이번 PR에 포함할 것인가?"
```

를 판단하는 기준이 된다.

---

## 14. GitHub Projects

GitHub Issue를 Board 형태로 관리할 수 있는 기능이다.

우리 팀에서는 다음과 같이 사용할 수 있다.

```text
Backlog
↓
Todo
↓
In Progress
↓
Review
↓
Done
```

Projects에서는 다음 정보를 함께 관리할 수 있다.

- Status
- Assignee
- Priority
- Iteration
- Issue / PR 연결
- Filter

핵심은 **현재 프로젝트가 어디까지 진행됐는지 한눈에 보는 것**이다.

---
