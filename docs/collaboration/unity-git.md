---
sidebar_position: 1
sidebar_label: 27. Unity 프로젝트와 Git
title: Unity 프로젝트와 Git
description: Unity 에셋, .meta 파일, LFS, YAML Merge 협업 규칙
tags: [git, github, collaboration]
---

# Unity 프로젝트와 Git

> **중요도: 중요** · 원본 협업 가이드에서 이 주제에 필요한 내용을 모았습니다.

## 27. Unity 프로젝트에서 Git을 사용할 때

Unity 프로젝트는 C# 코드만 관리하는 프로젝트가 아니다.

Scene, Prefab, Texture, Model 등 다양한 Asset이 존재하기 때문에 몇 가지 주의할 점이 있다.

---

### `.meta`

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

### Visible Meta Files

외부 Version Control System에서 `.meta` 파일을 함께 관리하기 위해 사용하는 설정이다.

Unity 버전에 따라 메뉴 위치가 조금 다를 수 있지만 Project Settings의 Version Control 관련 설정에서 확인할 수 있다.

---

### Force Text

Unity의 Serialized Asset을 가능한 Text 형식으로 저장한다.

Scene / Prefab 변경 사항을 Git Diff에서 확인하거나 Merge하기 쉽게 만들기 위해 사용한다.

---

### YAML

Unity의 Scene, Prefab 등의 Text Serialization에서 볼 수 있는 형식.

사람이 직접 작성할 일은 거의 없지만,

```text
"Scene 파일도 Git에서는 Text Diff로 보일 수 있다"
```

정도로 이해하면 된다.

---

### Git LFS

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

### UnityYAMLMerge

Unity가 제공하는 Smart Merge Tool.

Scene / Prefab처럼 Unity YAML 형식으로 저장된 파일의 Merge를 보조한다.

그래도 Scene Conflict는 복잡해질 수 있으므로 도구만 믿기보다는 **작업 범위를 미리 나누는 것이 더 중요하다.**

---
