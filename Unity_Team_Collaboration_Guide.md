# Unity 팀 개발 협업 가이드
### Git · GitHub · Pull Request · Code Review · CI

> **대상**: Git/GitHub 협업이 아직 익숙하지 않은 팀원  
> **목표**: 명령어를 외우는 것보다, **왜 이런 흐름으로 협업하는지 이해하는 것**  
> **프로젝트 기준**: Unity / 5인 비대면 개발 / GitHub 중심 협업

---

## 이 문서를 어떻게 보면 좋을까?

이번 프로젝트에서는 GitHub를 단순히 **코드를 올려두는 저장소**로만 사용하지 않는다.

우리가 익히려는 기본 흐름은 아래와 같다.

```text
Issue
  ↓
Branch
  ↓
Development
  ↓
Commit / Push
  ↓
Pull Request
  ↓
Code Review
  ↓
CI / Status Check
  ↓
Merge
  ↓
Done
```

처음부터 모든 기능을 능숙하게 사용할 필요는 없다.  
다만 **내가 지금 어느 단계에서 무엇을 하고 있는지**는 알고 사용하는 것을 목표로 한다.

> [!NOTE]
> 이 문서에서 `main`은 팀이 함께 사용하는 안정적인 기준 Branch를 의미한다.

---

# 1. Git과 GitHub

## Git

**Git**은 파일의 변경 이력을 기록하고 여러 사람이 같은 프로젝트를 안전하게 개발할 수 있도록 도와주는 **분산 버전 관리 시스템(DVCS)**이다.

쉽게 말하면,

```text
"누가, 언제, 무엇을 바꿨는가?"
```

를 기록하면서 서로의 작업을 합칠 수 있게 해주는 도구다.

Git은 내 컴퓨터에서도 동작한다.  
인터넷이 끊겨도 Commit을 만들고 History를 확인할 수 있다.

---

## GitHub

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

# 2. Git이 파일을 관리하는 흐름

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

## Working Directory

현재 내가 직접 수정하고 있는 프로젝트 파일이다.

예를 들어 Unity에서 `PlayerController.cs`를 수정했다면 아직은 Working Directory에 변경 사항이 존재하는 상태다.

---

## Staging Area

다음 Commit에 포함할 변경 사항을 고르는 공간이다.

```bash
git add PlayerController.cs
```

모든 수정 파일을 무조건 한 Commit에 넣을 필요는 없다.

---

## Commit

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

## Local Repository

내 컴퓨터에 존재하는 Git Repository다.

Commit을 했다고 바로 GitHub에 올라가는 것은 아니다.

---

## Remote Repository

GitHub 등에 존재하는 공유 Repository다.

보통 우리 팀에서는 GitHub Repository가 Remote Repository가 된다.

---

# 3. Repository / Clone / Remote

## Repository

Git이 변경 이력을 추적하는 프로젝트 저장소.

보통 줄여서 **Repo**라고도 한다.

---

## Clone

Remote Repository를 처음 내 컴퓨터로 복제하는 작업.

```bash
git clone <repository-url>
```

Clone을 하면 코드뿐 아니라 Git History도 함께 가져온다.

---

## Remote

Local Repository와 연결된 외부 Repository.

기본적으로 Clone했을 때 GitHub Repository에는 보통 다음 이름이 붙는다.

```text
origin
```

`origin`은 특별한 예약어가 아니라 **관습적으로 사용하는 Remote 이름**이다.

---

# 4. Push / Fetch / Pull

초반에 가장 많이 헷갈리는 세 가지다.

## Push

내 Local Commit을 Remote Repository로 올린다.

```text
Local → Remote
```

```bash
git push
```

---

## Fetch

Remote Repository에 어떤 변화가 생겼는지 **정보를 가져온다.**

하지만 현재 작업 Branch에 바로 합치지는 않는다.

```bash
git fetch
```

---

## Pull

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

# 5. Commit

## 좋은 Commit이란?

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

## Commit Hash

각 Commit에는 고유한 식별값이 존재한다.

예:

```text
a82f18c...
```

Git은 이 값을 이용해 특정 Commit을 정확히 가리킬 수 있다.

---

## History

Commit이 쌓여 만들어진 프로젝트의 변경 이력이다.

```bash
git log
```

---

## Diff

두 상태 사이에서 **무엇이 변경되었는지** 보여주는 차이다.

PR Code Review에서도 결국 Reviewer가 가장 많이 보는 것은 이 Diff다.

```text
기존 코드
- speed = 5;

변경 코드
+ speed = 8;
```

---

# 6. Branch

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

## 왜 Branch를 사용할까?

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

# 7. HEAD

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

# 8. Merge

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

# 9. Merge Conflict

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

## Conflict Resolution

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

# 10. 변경을 되돌리는 방법

비슷해 보이지만 역할이 다르다.

## restore

현재 작업 파일의 변경 내용을 되돌릴 때 사용한다.

아직 Commit하지 않은 작업을 취소할 때 주로 사용한다.

---

## revert

기존 Commit을 삭제하는 대신, **그 Commit의 변경을 반대로 수행하는 새로운 Commit**을 만든다.

```text
Commit A
Commit B
Commit C
Commit C를 취소하는 Commit D
```

공유된 History를 보존하기 때문에 팀 Repository에서는 비교적 안전한 방법이다.

---

## reset

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

# 11. Stash

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

# 12. GitHub Issue

Issue는 개발해야 할 작업, Bug, 개선 사항 등을 추적하는 기본 단위다.

예:

```text
[Player] Dash 기능 구현
[Bug] Turret이 제거된 Enemy를 계속 Targeting하는 문제
```

## 자주 쓰는 기능

### Assignee

해당 Issue의 담당자.

### Label

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

### Milestone

여러 Issue를 특정 목표에 묶을 때 사용한다.

예:

```text
Combat Prototype
Alpha
Demo Release
```

---

## Acceptance Criteria

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

# 13. Task Management에서 자주 쓰는 용어

## Backlog

해야 할 가능성이 있지만 아직 이번 작업 주기에 들어오지 않은 Task 목록.

---

## Todo

가까운 시기에 실제로 진행하기로 결정한 Task.

---

## In Progress

현재 누군가 작업하고 있는 상태.

---

## Review

PR이 생성되어 Review를 기다리고 있거나 Review 중인 상태.

---

## Done

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

## Priority

작업 우선순위.

---

## Dependency

다른 Task나 System이 먼저 필요하거나 서로 의존하는 관계.

```text
Enemy Damage 구현
      ↑
Damage System 필요
```

---

## Blocker

작업 진행을 막고 있는 문제.

Blocker가 생겼다면 혼자 오래 끌기보다 빠르게 공유한다.

---

## Scope

현재 작업에서 **포함하는 범위**.

PR이나 Issue가 커질 때 특히 중요한 개념이다.

```text
"이 변경까지 이번 PR에 포함할 것인가?"
```

를 판단하는 기준이 된다.

---

# 14. GitHub Projects

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

# 15. Pull Request

Pull Request, 줄여서 **PR**은 이번 프로젝트에서 가장 중요한 협업 기능 중 하나다.

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

## PR에서 주로 확인하는 것

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

## Draft PR

아직 Merge할 준비는 되지 않았지만 작업 방향이나 진행 상황을 공유하고 싶을 때 사용할 수 있다.

예:

```text
구조를 크게 바꾸고 있어서
완성 전에 의견을 받고 싶다.
```

이런 경우 유용하다.

---

# 16. Issue와 PR 연결

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

# 17. Code Review

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

## Reviewer가 볼 수 있는 것

### Correctness

의도대로 동작하는가?

### Readability

다른 사람이 읽고 이해하기 쉬운가?

### Naming

Class, Method, Variable 이름이 역할을 잘 표현하는가?

### Responsibility

한 Class나 Method가 너무 많은 역할을 맡고 있지 않은가?

### Coupling

다른 System과 지나치게 강하게 연결되어 있지 않은가?

### Duplication

같은 로직이 불필요하게 반복되고 있지 않은가?

### Edge Case

평소에는 드러나지 않는 경계 상황에서 문제가 발생하지 않는가?

### Regression

새 변경으로 기존 기능이 망가지지 않는가?

### Unity Asset Change

의도하지 않은 Scene, Prefab, `.meta` 변경이 섞여 있지 않은가?

---

## Review 결과

GitHub Review에서는 보통 다음 중 하나를 선택할 수 있다.

### Comment

의견만 남긴다.

### Approve

현재 변경 사항을 Merge해도 괜찮다고 판단한다.

### Request Changes

Merge 전에 수정이 필요하다고 판단한다.

> [!NOTE]
> `Approve`는 "대충 봤음" 버튼이 아니다.  
> 자신이 확인 가능한 범위에서 Shared Code에 들어가도 괜찮다고 판단했다는 의미로 사용한다.

---

## Review Comment 표현

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

## LGTM

**Looks Good To Me**

Review에서 자주 사용되는 표현이다.

다만 실제 코드를 확인하지 않고:

```text
LGTM
Approve
```

만 반복하는 방식은 지양한다.

---

# 18. Merge Strategy

GitHub에서는 PR을 합치는 방법이 여러 가지다.

## Merge Commit

Branch의 Commit History를 유지하면서 Merge Commit을 하나 추가한다.

---

## Squash and Merge

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

## Rebase and Merge

Commit의 기반을 재배치하여 History를 선형으로 유지한다.

초반에는 개념만 알아두어도 충분하다.

---

# 19. main과 Stable Branch

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

# 20. Ruleset / Branch Protection

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

# 21. GitHub Actions

GitHub Actions는 GitHub Repository에서 발생하는 Event를 기준으로 **자동화 작업을 실행할 수 있는 기능**이다.

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

## GitHub Actions의 핵심 구조

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

## Workflow

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

## Event / Trigger

Workflow를 실행하게 만드는 조건.

대표적으로:

```text
push
pull_request
workflow_dispatch
```

### workflow_dispatch

GitHub 화면에서 사용자가 직접 Workflow를 실행할 수 있도록 하는 Trigger.

---

## Job

Workflow 안에서 수행되는 큰 작업 단위.

예:

```text
Test
Build
Package
```

Job은 서로 병렬로 실행되거나 순서를 가질 수도 있다.

---

## Step

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

## Runner

Workflow를 실제로 실행하는 컴퓨터 환경이다.

GitHub가 제공하는 Runner 예:

```text
Ubuntu
Windows
macOS
```

직접 관리하는 **Self-hosted Runner**를 사용할 수도 있다.

---

## Action

반복적으로 사용되는 자동화 동작을 재사용할 수 있게 만든 Component.

대표적인 예:

```text
actions/checkout
```

Runner가 Repository Code를 가져오게 해주는 Action이다.

---

# 22. GitHub Actions와 CI의 차이

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

# 23. CI / Status Check

## CI — Continuous Integration

여러 개발자의 변경 사항을 자주 통합하면서 Build나 Test 등을 자동으로 검증하는 방식.

PR을 만들었을 때:

```text
Build ✅
Test ✅
```

가 확인되면 Merge에 대한 신뢰도를 높일 수 있다.

---

## Status Check

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

# 24. Artifact / Secret / Cache

## Artifact

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

## Secret

Token, API Key, Webhook URL처럼 공개되면 안 되는 값을 안전하게 저장하는 기능.

예:

```text
UNITY_LICENSE
DISCORD_WEBHOOK
API_KEY
```

민감한 값을 Workflow YAML에 직접 작성하지 않는다.

---

## Cache

Dependency나 Build 중간 결과처럼 반복해서 사용하는 데이터를 재사용하여 Workflow 실행 시간을 줄이는 방법.

처음에는:

```text
"CI가 느릴 때 사용하는 최적화 기능"
```

정도로 이해해도 충분하다.

---

# 25. GitHub Template

## Issue Template

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

## Pull Request Template

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

# 26. Tag / Release / Version

## Tag

특정 Commit에 이름을 붙이는 기능.

```text
v0.1.0
v0.2.0
v1.0.0
```

---

## Release

Tag를 기준으로 GitHub에서 배포 Version을 관리할 수 있다.

게임 Build나 Release Note를 함께 제공할 수도 있다.

---

## Semantic Versioning

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

# 27. Unity 프로젝트에서 Git을 사용할 때

Unity 프로젝트는 C# 코드만 관리하는 프로젝트가 아니다.

Scene, Prefab, Texture, Model 등 다양한 Asset이 존재하기 때문에 몇 가지 주의할 점이 있다.

---

## `.meta`

Unity는 Asset마다 `.meta` 파일을 생성한다.

이 파일에는 Asset을 식별하기 위한 GUID 등 Unity가 Project Reference를 유지하는 데 필요한 정보가 포함된다.

예:

```text
Player.prefab
Player.prefab.meta
```

Asset만 Git에 올리고 `.meta`를 빼먹으면 다른 팀원의 Project에서 Reference 문제가 발생할 수 있다.

**Asset과 `.meta`는 함께 관리한다.**

---

## Visible Meta Files

외부 Version Control System에서 `.meta` 파일을 함께 관리하기 위해 사용하는 설정이다.

Unity 버전에 따라 메뉴 위치가 조금 다를 수 있지만 Project Settings의 Version Control 관련 설정에서 확인할 수 있다.

---

## Force Text

Unity의 Serialized Asset을 가능한 Text 형식으로 저장한다.

Scene / Prefab 변경 사항을 Git Diff에서 확인하거나 Merge하기 쉽게 만들기 위해 사용한다.

---

## YAML

Unity의 Scene, Prefab 등의 Text Serialization에서 볼 수 있는 형식.

사람이 직접 작성할 일은 거의 없지만,

```text
"Scene 파일도 Git에서는 Text Diff로 보일 수 있다"
```

정도로 이해하면 된다.

---

## Git LFS

**Git Large File Storage**

큰 Binary File을 일반 Git Object와 다르게 관리하기 위한 기능이다.

예:

- PSD
- FBX
- WAV
- MP4
- 대형 Texture

같은 파일에서 사용할 수 있다.

> [!NOTE]
> 무조건 모든 Asset을 LFS에 넣는 것이 정답은 아니다.  
> 프로젝트의 Asset 규모와 Repository 정책을 보고 결정한다.

---

## UnityYAMLMerge

Unity가 제공하는 Smart Merge Tool.

Scene / Prefab처럼 Unity YAML 형식으로 저장된 파일의 Merge를 보조한다.

그래도 Scene Conflict는 복잡해질 수 있으므로 도구만 믿기보다는 **작업 범위를 미리 나누는 것이 더 중요하다.**

---

# 28. Git에서 알아두면 좋은 추가 기능

## Blame

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

## Cherry-pick

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

## Fork

다른 Repository를 내 GitHub 계정 쪽에 독립적인 Repository로 만들어 작업하는 방식.

팀 내부 Collaborator 방식에서는 자주 쓰지 않을 수 있지만 Open Source에서는 흔하다.

```text
Clone
= Repository를 내 PC로 가져오기

Fork
= Repository를 내 GitHub 계정 쪽으로 가져오기
```

---

# 29. Software Engineering에서 자주 쓰는 용어

## Architecture

System 전체의 구조와 Component 간 관계.

---

## Dependency

한 Module, Class, System이 다른 요소를 필요로 하는 관계.

---

## Coupling

두 Component가 얼마나 강하게 연결되어 있는지를 나타내는 개념.

일반적으로 지나치게 강한 Coupling은 변경을 어렵게 만들 수 있다.

---

## Cohesion

하나의 Module이나 Class 안의 기능들이 얼마나 서로 관련된 Responsibility를 가지고 있는지 나타내는 개념.

---

## Responsibility

Class, Module, System이 담당해야 하는 역할.

---

## Refactoring

외부 동작을 바꾸지 않으면서 내부 Code Structure를 개선하는 작업.

---

## Technical Debt

빠른 개발이나 임시 설계 등으로 인해 나중에 추가적인 수정 비용이 발생하는 상태.

기술적 부채는 무조건 나쁜 것이 아니라 **의도적으로 만들었는지, 언제 갚을 것인지 알고 있는가**도 중요하다.

---

## Regression

새로운 변경으로 인해 기존에 잘 동작하던 기능이 망가지는 현상.

```text
Dash 기능 추가
↓
기존 Jump가 작동하지 않음

→ Regression
```

---

## Edge Case

일반적인 상황에서는 잘 발생하지 않지만 특정 조건에서 발생하는 경계 상황.

---

## Troubleshooting

문제가 발생했을 때 원인을 추적하고 해결하는 과정 전체.

```text
증상 확인
↓
재현
↓
원인 가설
↓
검증
↓
수정
↓
재검증
```

단순히:

```text
"에러를 고쳤다"
```

보다 넓은 개념이다.

---

## Bottleneck

전체 System의 성능이나 진행 속도를 제한하는 가장 큰 지점.

예:

```text
CPU Bottleneck
GPU Bottleneck
Network Bottleneck
I/O Bottleneck
Development Bottleneck
```

---

## Tick

Game Engine에서 Frame 또는 일정 Update 주기마다 반복적으로 실행되는 처리 단위를 흔히 Tick이라고 부른다.

Unity에서는 대표적으로 다음 Update Loop와 연결해 이해할 수 있다.

```text
Update
FixedUpdate
LateUpdate
```

다만 Engine마다 Tick의 정확한 구조와 의미는 다를 수 있다.

---

## Hotfix

서비스나 주요 Build에 발생한 심각한 문제를 빠르게 수정하는 변경.

---

## Workaround

근본적인 원인을 해결한 것은 아니지만 문제를 우회하여 동작하게 만드는 방법.

---

## Legacy Code

기존부터 존재하던 코드 중 현재 구조와 잘 맞지 않거나 변경하기 어려운 Code/System을 흔히 이렇게 부른다.

오래됐다는 이유만으로 무조건 나쁜 코드를 의미하는 것은 아니다.

---

## Breaking Change

기존 Interface나 사용 방식과 호환되지 않는 변경.

---

# 30. PoC / Prototype / MVP

서로 비슷해 보여 헷갈리기 쉽다.

## PoC — Proof of Concept

**이 기술이나 아이디어가 실제로 가능한가?**

를 검증하기 위한 구현.

예:

```text
Unity Netcode를 이용해서
4인 협동 플레이가 가능한지 검증한다.
```

완성된 게임을 만드는 것이 목적이 아니다.

핵심 기술의 **실현 가능성**을 확인하는 것이 목적이다.

---

## Prototype

**게임 방식이 실제로 동작하고 재미있는가?**

를 빠르게 확인하기 위한 구현.

그래픽이나 완성도보다 Gameplay 검증에 집중하는 경우가 많다.

---

## MVP — Minimum Viable Product

사용자에게 제공할 수 있는 **최소한의 제품 형태**.

정리하면:

```text
PoC
→ 가능한가?

Prototype
→ 실제로 동작하는가? 재미있는가?

MVP
→ 최소한 제품으로 사용할 수 있는가?
```

---

# 31. 자주 보는 약어와 표현

| 표현 | 의미 |
|---|---|
| **PR** | Pull Request |
| **LGTM** | Looks Good To Me |
| **WIP** | Work In Progress |
| **FYI** | For Your Information |
| **IMO** | In My Opinion |
| **IMHO** | In My Humble Opinion |
| **AFAIK** | As Far As I Know |
| **TBD** | To Be Determined |
| **TODO** | 추후 해야 할 작업 |
| **FIXME** | 수정이 필요한 부분 |
| **CI** | Continuous Integration |
| **CD** | Continuous Delivery / Deployment |
| **DoD** | Definition of Done |
| **PoC** | Proof of Concept |
| **MVP** | Minimum Viable Product |
| **GDD** | Game Design Document |
| **ADR** | Architecture Decision Record |

> [!NOTE]
> 전문 용어를 많이 쓰는 것이 목적은 아니다.  
> **의미를 알고 정확한 상황에서 사용하는 것**을 목표로 한다.

---

# 32. 이번 주 온보딩 실습

읽는 것만으로는 Git 협업에 익숙해지기 어렵다.

가능하면 테스트용 Repository에서 아래 과정을 전원이 한 번씩 직접 해본다.

## Step 1 — Repository 사용

- [ ] Repository Clone
- [ ] `git status` 확인
- [ ] 파일 수정
- [ ] Stage
- [ ] Commit
- [ ] Push
- [ ] GitHub에서 Commit 확인

---

## Step 2 — Branch

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

## Step 3 — Issue

- [ ] 테스트 Issue 생성
- [ ] Assignee 지정
- [ ] Label 지정
- [ ] Acceptance Criteria 작성

---

## Step 4 — Pull Request

- [ ] Issue 기반 Branch에서 작업
- [ ] PR 생성
- [ ] `Closes #Issue번호` 연결
- [ ] Reviewer 지정
- [ ] Files Changed 직접 확인
- [ ] Self Review

---

## Step 5 — Code Review

본인이 작성하지 않은 PR을 하나 Review한다.

- [ ] Diff 확인
- [ ] 최소 하나의 Question 또는 Comment 작성
- [ ] 필요한 경우 Suggestion 작성
- [ ] Approve 또는 Request Changes 선택

---

## Step 6 — Review 반영

- [ ] Review Comment 확인
- [ ] 필요한 코드 수정
- [ ] 다시 Commit / Push
- [ ] PR에 변경 사항이 자동 반영되는지 확인
- [ ] Conversation Resolve

---

## Step 7 — Merge

- [ ] Review 완료 확인
- [ ] CI / Check 확인
- [ ] Conflict 여부 확인
- [ ] Squash and Merge
- [ ] Issue Close 확인
- [ ] Branch 삭제

---

## Step 8 — Merge Conflict를 일부러 만들어보기

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

> [!TIP]
> Merge Conflict는 한 번 직접 만들어서 해결해 보면 훨씬 덜 무섭다.

---

## Step 9 — GitHub Actions 확인

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

# 33. 우리 팀에서 기억할 것

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

# 마지막으로

이번 프로젝트에서 GitHub를 사용하는 목적은 단순히:

```text
"GitHub 써봤다."
```

를 만들기 위한 것이 아니다.

프로젝트가 끝났을 때 팀원 모두가 최소한 다음 말을 할 수 있으면 좋다.

> Issue를 만들고, Branch에서 작업하고, PR을 작성해서 다른 사람의 Review를 받은 뒤 CI를 확인하고 Merge하는 협업 흐름을 직접 경험했다.

그리고 다른 사람의 코드를 읽고 질문하고 의견을 주고받는 과정 역시 **개발 실력의 일부**로 생각한다.

---

### Quick Cheat Sheet

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
