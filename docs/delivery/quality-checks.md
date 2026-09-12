---
sidebar_position: 1
sidebar_label: 21–26. CI·Actions·릴리스
title: CI, GitHub Actions와 릴리스
description: 자동 검증, 상태 확인, 템플릿과 버전 관리
tags: [git, github, collaboration]
---

import actionsImage from '@site/static/img/guide/guide-03-github-actions.png';

# CI, GitHub Actions와 릴리스

> **중요도: 중요** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 21. GitHub Actions

GitHub Actions는 GitHub Repository에서 발생하는 Event를 기준으로 **자동화 작업을 실행할 수 있는 기능**이다.

<figure className="guide-screenshot">
  <img src={actionsImage} alt="GitHub Actions 워크플로가 성공한 결과와 검사 단계를 보여 주는 화면" />
  <figcaption>Pull Request에 연결된 자동 검사와 실행 결과를 확인하는 예시</figcaption>
</figure>

대표적으로:

- Build
- Test
- Lint
- Packaging
- Release
- Deployment

등을 자동화할 수 있다.

Unity 프로젝트라면 예를 들어:

```text
Pull Request Open
       ↓
GitHub Actions
       ↓
Unity Test
       ↓
Unity Build
       ↓
Success / Fail
```

과 같은 흐름을 만들 수 있다.

---

### GitHub Actions의 핵심 구조

```text
Event / Trigger
      ↓
Workflow
      ↓
Job
      ↓
Step
      ↓
Runner
```

조금 더 풀어보면:

```text
Pull Request 생성
        │
        │ Event
        ▼
┌──────────────────────┐
│       Workflow       │
│                      │
│  Job: Test           │
│   ├─ Step            │
│   ├─ Step            │
│   └─ Step            │
│                      │
│  Job: Build          │
│   ├─ Step            │
│   └─ Step            │
└──────────┬───────────┘
           │
         Runner
           │
           ▼
        ✅ / ❌
```

---

### Workflow

자동화 전체 Process.

보통 Repository의 다음 경로에 YAML 파일로 작성한다.

```text
.github/workflows/
```

예:

```text
.github/workflows/build.yml
```

---

### Event / Trigger

Workflow를 실행하게 만드는 조건.

대표적으로:

```text
push
pull_request
workflow_dispatch
```

#### workflow_dispatch

GitHub 화면에서 사용자가 직접 Workflow를 실행할 수 있도록 하는 Trigger.

---

### Job

Workflow 안에서 수행되는 큰 작업 단위.

예:

```text
Test
Build
Package
```

Job은 서로 병렬로 실행되거나 순서를 가질 수도 있다.

---

### Step

Job 안에서 실제로 실행되는 세부 단계.

예:

```text
Checkout
↓
Dependency 준비
↓
Test 실행
↓
Build 실행
```

---

### Runner

Workflow를 실제로 실행하는 컴퓨터 환경이다.

GitHub가 제공하는 Runner 예:

```text
Ubuntu
Windows
macOS
```

직접 관리하는 **Self-hosted Runner**를 사용할 수도 있다.

---

### Action

반복적으로 사용되는 자동화 동작을 재사용할 수 있게 만든 Component.

대표적인 예:

```text
actions/checkout
```

Runner가 Repository Code를 가져오게 해주는 Action이다.

---

## 22. GitHub Actions와 CI의 차이

둘은 같은 말이 아니다.

```text
GitHub Actions
= 자동화를 실행하는 도구

CI
= 지속적으로 변경 사항을 통합하고 자동 검증하는 개발 Practice
```

즉,

```text
GitHub Actions를 이용해 CI를 구축한다.
```

라고 표현하는 것이 더 정확하다.

---

## 23. CI / Status Check

### CI — Continuous Integration

여러 개발자의 변경 사항을 자주 통합하면서 Build나 Test 등을 자동으로 검증하는 방식.

PR을 만들었을 때:

```text
Build ✅
Test ✅
```

가 확인되면 Merge에 대한 신뢰도를 높일 수 있다.

---

### Status Check

GitHub에서 자동화 결과를 PR에 표시하는 상태 정보.

```text
Build ✅
Test ✅
```

또는:

```text
Build ❌
```

Ruleset과 연결하면:

```text
CI 실패
↓
Merge 차단
```

도 가능하다.

---

## 24. Artifact / Secret / Cache

### Artifact

Workflow 실행 중 생성된 결과물을 저장할 수 있다.

Unity에서는 예를 들어:

```text
Windows Build
Test Report
Log
Game.zip
```

같은 결과물을 Artifact로 남길 수 있다.

---

### Secret

Token, API Key, Webhook URL처럼 공개되면 안 되는 값을 안전하게 저장하는 기능.

예:

```text
UNITY_LICENSE
DISCORD_WEBHOOK
API_KEY
```

민감한 값을 Workflow YAML에 직접 작성하지 않는다.

---

### Cache

Dependency나 Build 중간 결과처럼 반복해서 사용하는 데이터를 재사용하여 Workflow 실행 시간을 줄이는 방법.

처음에는:

```text
"CI가 느릴 때 사용하는 최적화 기능"
```

정도로 이해해도 충분하다.

---

## 25. GitHub Template

### Issue Template

Issue를 만들 때 일정한 형식을 제공한다.

예:

```text
Bug Report
Feature Request
```

Bug Template 예:

```text
Environment
Steps to Reproduce
Expected Behavior
Actual Behavior
Screenshot / Video
```

---

### Pull Request Template

PR 생성 시 작성할 내용을 자동으로 제공한다.

예:

```text
Summary
Changes
Review Point
Test
Related Issue
```

Template을 사용하면 중요한 내용을 빼먹을 가능성이 줄어든다.

---

## 26. Tag / Release / Version

### Tag

특정 Commit에 이름을 붙이는 기능.

```text
v0.1.0
v0.2.0
v1.0.0
```

---

### Release

Tag를 기준으로 GitHub에서 배포 Version을 관리할 수 있다.

게임 Build나 Release Note를 함께 제공할 수도 있다.

---

### Semantic Versioning

보통 다음 형태를 사용한다.

```text
MAJOR.MINOR.PATCH

1.4.2
```

일반적인 의미:

```text
MAJOR
호환성이 깨지는 큰 변경

MINOR
새로운 기능

PATCH
Bug Fix
```

게임 프로젝트가 반드시 엄격하게 따를 필요는 없지만 Version 체계를 이해하는 데 도움이 된다.

---
