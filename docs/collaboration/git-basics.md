---
sidebar_position: 1
sidebar_label: 01–04. Git 기본 흐름
title: Git과 기본 작업 흐름
description: Git, GitHub, 저장소와 원격 동기화의 기초
tags: [git, github, collaboration]
---

# Git과 기본 작업 흐름

> **중요도: 필수** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 1. Git과 GitHub

### Git

**Git**은 파일의 변경 이력을 기록하고 여러 사람이 같은 프로젝트를 안전하게 개발할 수 있도록 도와주는 **분산 버전 관리 시스템(DVCS)**이다.

쉽게 말하면,

```text
"누가, 언제, 무엇을 바꿨는가?"
```

를 기록하면서 서로의 작업을 합칠 수 있게 해주는 도구다.

Git은 내 컴퓨터에서도 동작한다.
인터넷이 끊겨도 Commit을 만들고 History를 확인할 수 있다.

---

### GitHub

**GitHub**는 Git Repository를 온라인에서 관리하면서 협업 기능을 제공하는 플랫폼이다.

대표적으로 다음 기능을 제공한다.

- Repository
- Issue
- Pull Request
- Code Review
- Projects
- Actions
- Release
- Ruleset

즉,

```text
Git     = 버전 관리 시스템
GitHub  = Git을 기반으로 협업하기 위한 플랫폼
```

이라고 이해하면 된다.

> [!TIP]
> Git과 GitHub는 같은 것이 아니다.
> GitHub 없이 Git만 사용할 수도 있고, GitHub는 Git 위에 여러 협업 기능을 더해주는 서비스에 가깝다.

---

## 2. Git이 파일을 관리하는 흐름

Git을 처음 배울 때 가장 중요한 부분이다.

```text
Working Directory
       ↓ git add
Staging Area
       ↓ git commit
Local Repository
       ↓ git push
Remote Repository
```

### Working Directory

현재 내가 직접 수정하고 있는 프로젝트 파일이다.

예를 들어 Unity에서 `PlayerController.cs`를 수정했다면 아직은 Working Directory에 변경 사항이 존재하는 상태다.

---

### Staging Area

다음 Commit에 포함할 변경 사항을 고르는 공간이다.

```bash
git add PlayerController.cs
```

모든 수정 파일을 무조건 한 Commit에 넣을 필요는 없다.

---

### Commit

선택한 변경 사항을 하나의 **의미 있는 이력 단위**로 저장한다.

```bash
git commit -m "feat: add player dash"
```

Commit은 단순 저장 버튼이 아니다.

```text
"이 시점에 이런 변경을 했다"
```

라는 프로젝트 History를 만드는 작업이다.

---

### Local Repository

내 컴퓨터에 존재하는 Git Repository다.

Commit을 했다고 바로 GitHub에 올라가는 것은 아니다.

---

### Remote Repository

GitHub 등에 존재하는 공유 Repository다.

보통 우리 팀에서는 GitHub Repository가 Remote Repository가 된다.

---

## 3. Repository / Clone / Remote

### Repository

Git이 변경 이력을 추적하는 프로젝트 저장소.

보통 줄여서 **Repo**라고도 한다.

---

### Clone

Remote Repository를 처음 내 컴퓨터로 복제하는 작업.

```bash
git clone <repository-url>
```

Clone을 하면 코드뿐 아니라 Git History도 함께 가져온다.

---

### Remote

Local Repository와 연결된 외부 Repository.

기본적으로 Clone했을 때 GitHub Repository에는 보통 다음 이름이 붙는다.

```text
origin
```

`origin`은 특별한 예약어가 아니라 **관습적으로 사용하는 Remote 이름**이다.

---

## 4. Push / Fetch / Pull

초반에 가장 많이 헷갈리는 세 가지다.

### Push

내 Local Commit을 Remote Repository로 올린다.

```text
Local → Remote
```

```bash
git push
```

---

### Fetch

Remote Repository에 어떤 변화가 생겼는지 **정보를 가져온다.**

하지만 현재 작업 Branch에 바로 합치지는 않는다.

```bash
git fetch
```

---

### Pull

Remote의 변경 사항을 가져와 현재 Branch에 반영한다.

개념적으로 보면 보통 다음과 비슷하다.

```text
fetch
+
merge 또는 rebase
```

```bash
git pull
```

> [!NOTE]
> 팀원이 GitHub에 Push했다고 해서 내 프로젝트가 자동으로 바뀌는 것은 아니다.
> Local Repository와 Remote Repository는 서로 다른 저장소다.

---
