---
sidebar_position: 1
sidebar_label: 32–33. 온보딩 실습
title: 온보딩 실습
description: Issue부터 Merge까지 직접 완주하는 TeamHJD 협업 실습
tags: [git, github, collaboration]
---

# 온보딩 실습

> **중요도: 필수** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 32. 이번 주 온보딩 실습

읽는 것만으로는 Git 협업에 익숙해지기 어렵다.

가능하면 테스트용 Repository에서 아래 과정을 전원이 한 번씩 직접 해본다.

### Step 1 — Repository 사용

- [ ] Repository Clone
- [ ] `git status` 확인
- [ ] 파일 수정
- [ ] Stage
- [ ] Commit
- [ ] Push
- [ ] GitHub에서 Commit 확인

---

### Step 2 — Branch

- [ ] `main` 최신 상태 확인
- [ ] Feature Branch 생성
- [ ] Branch에서 파일 수정
- [ ] Commit
- [ ] Push

예:

```text
feat/git-practice-이름
```

---

### Step 3 — Issue

- [ ] 테스트 Issue 생성
- [ ] Assignee 지정
- [ ] Label 지정
- [ ] Acceptance Criteria 작성

---

### Step 4 — Pull Request

- [ ] Issue 기반 Branch에서 작업
- [ ] PR 생성
- [ ] `Closes #Issue번호` 연결
- [ ] Reviewer 지정
- [ ] Files Changed 직접 확인
- [ ] Self Review

---

### Step 5 — Code Review

본인이 작성하지 않은 PR을 하나 Review한다.

- [ ] Diff 확인
- [ ] 최소 하나의 Question 또는 Comment 작성
- [ ] 필요한 경우 Suggestion 작성
- [ ] Approve 또는 Request Changes 선택

---

### Step 6 — Review 반영

- [ ] Review Comment 확인
- [ ] 필요한 코드 수정
- [ ] 다시 Commit / Push
- [ ] PR에 변경 사항이 자동 반영되는지 확인
- [ ] Conversation Resolve

---

### Step 7 — Merge

- [ ] Review 완료 확인
- [ ] CI / Check 확인
- [ ] Conflict 여부 확인
- [ ] Squash and Merge
- [ ] Issue Close 확인
- [ ] Branch 삭제

---

### Step 8 — Merge Conflict를 일부러 만들어보기

팀원 두 명이 같은 파일의 같은 줄을 서로 다르게 수정한다.

```text
Branch A
speed = 5;

Branch B
speed = 10;
```

그리고 Merge를 시도해 Conflict를 직접 발생시켜 본다.

- [ ] Conflict가 왜 발생했는지 확인
- [ ] Conflict Marker 확인
- [ ] 올바른 값을 직접 결정
- [ ] Conflict Resolution
- [ ] 정상 Merge

:::tip
Merge Conflict는 한 번 직접 만들어서 해결해 보면 훨씬 덜 무섭습니다.
:::

---

### Step 9 — GitHub Actions 확인

우리 Repository에 존재하는 Workflow를 직접 열어본다.

확인할 것:

- [ ] `.github/workflows` 위치
- [ ] 어떤 Event에서 실행되는가?
- [ ] 어떤 Job이 존재하는가?
- [ ] 어떤 Runner를 사용하는가?
- [ ] 어떤 Step을 실행하는가?
- [ ] PR에서 Status Check가 어디에 표시되는가?
- [ ] 실패한 Workflow Log는 어디서 보는가?
- [ ] Artifact가 있다면 어디에서 받는가?

Workflow YAML을 처음부터 직접 작성할 필요는 없다.

우선은:

```text
"이 YAML이 어떤 자동화 흐름을 표현하고 있는지"
```

읽을 수 있는 것을 목표로 한다.

---

## 33. 우리 팀에서 기억할 것

Git 명령어를 많이 아는 것보다 다음 흐름을 자연스럽게 사용할 수 있는 것이 더 중요하다.

```text
작업이 생긴다.
↓
Issue로 남긴다.
↓
Branch를 만든다.
↓
작업하고 Commit한다.
↓
PR을 만든다.
↓
다른 사람이 Review한다.
↓
자동화된 Check를 통과한다.
↓
Merge한다.
↓
Issue를 닫는다.
```

그리고 문제가 생겼을 때:

```text
숨기거나 혼자 오래 끌기
```

보다:

```text
공유
→ 원인 확인
→ Discussion
→ 해결
→ 기록
```

하는 습관을 만든다.

---

## 마지막으로

이번 프로젝트에서 GitHub를 사용하는 목적은 단순히:

```text
"GitHub 써봤다."
```

를 만들기 위한 것이 아니다.

프로젝트가 끝났을 때 팀원 모두가 최소한 다음 말을 할 수 있으면 좋다.

> Issue를 만들고, Branch에서 작업하고, PR을 작성해서 다른 사람의 Review를 받은 뒤 CI를 확인하고 Merge하는 협업 흐름을 직접 경험했다.

그리고 다른 사람의 코드를 읽고 질문하고 의견을 주고받는 과정 역시 **개발 실력의 일부**로 생각한다.

---

#### Quick Cheat Sheet

```text
Git
└─ Version Control

GitHub
└─ Collaboration Platform

Issue
└─ 해야 할 일 / 문제 추적

Branch
└─ 독립적인 작업 공간

Commit
└─ 의미 있는 변경 이력

Push
└─ Local → Remote

Pull
└─ Remote 변경 가져오기 + 반영

PR
└─ 변경 공유 + Review 요청

Code Review
└─ 검증 + Discussion + Knowledge Sharing

CI
└─ 변경 사항 자동 검증

GitHub Actions
└─ CI 등을 실행할 수 있는 Automation Platform

Merge
└─ Branch 변경 통합

Conflict
└─ Git이 자동으로 선택할 수 없는 변경 충돌

DoD
└─ "진짜 Done"이라고 판단할 기준
```
