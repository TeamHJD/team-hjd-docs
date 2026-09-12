---
sidebar_position: 3
sidebar_label: 31. 약어와 표현
title: 약어와 표현
description: PR, CI, WIP 등 TeamHJD 협업에서 자주 쓰는 약어와 사용 예시
tags: [reference, abbreviations, collaboration]
---

# 약어와 표현

> **중요도: 참고** · 메시지·Issue·PR에서 만나는 줄임말을 빠르게 확인합니다. 약어는 편의를 위한 것이며, 상대가 모를 수 있다면 처음에는 풀어 씁니다.

## 31. 자주 보는 약어와 표현

### 협업과 의사소통

| 약어 | 풀어쓴 말 | 뜻 | 사용 예시 |
| --- | --- | --- | --- |
| **PR** | Pull Request | 변경을 검토·병합하기 위한 요청 | “대시 기능 PR 올렸습니다. 테스트 방법을 설명에 적어뒀어요.” |
| **LGTM** | Looks Good To Me | 검토 결과 큰 문제 없이 좋다는 뜻 | “예외 처리까지 확인했습니다. LGTM!” |
| **WIP** | Work In Progress | 아직 진행 중인 작업 | “WIP PR입니다. 구조에 대한 의견만 먼저 받고 싶어요.” |
| **FYI** | For Your Information | 참고로 공유하는 정보 | “FYI, Unity 6에서 해당 API가 deprecated 되었습니다.” |
| **IMO** | In My Opinion | 개인 의견임을 밝힘 | “IMO 이 로직은 별도 Component로 분리하는 편이 읽기 좋습니다.” |
| **IMHO** | In My Humble Opinion | 조심스럽게 개인 의견을 말함 | “IMHO 지금은 기능 범위를 줄이는 게 안전해 보여요.” |
| **AFAIK** | As Far As I Know | 아는 범위에서는 | “AFAIK 이 설정은 Android Build에만 영향을 줍니다.” |
| **TBD** | To Be Determined | 아직 결정되지 않음 | “출시 날짜는 TBD이며, 플레이 테스트 후 정합니다.” |

### 작업과 품질

| 약어 | 풀어쓴 말 | 뜻 | 사용 예시 |
| --- | --- | --- | --- |
| **TODO** | To Do | 앞으로 해야 할 작업을 표시 | “`TODO: 서버 응답 실패 시 재시도 정책 추가`” |
| **FIXME** | Fix Me | 현재 문제가 있어 수정이 필요함을 표시 | “`FIXME: 적이 없을 때 null 예외 발생`” |
| **CI** | Continuous Integration | 변경마다 자동 검증을 실행하는 방식 | “CI가 실패했으니 로그를 확인하고 PR을 업데이트할게요.” |
| **CD** | Continuous Delivery / Deployment | 검증된 변경을 전달·배포하는 자동화 흐름 | “현재는 CI만 자동화했고, CD 범위는 다음 스프린트에 논의한다.” |
| **DoD** | Definition of Done | 작업을 완료로 판단하는 팀의 기준 | “이 Issue의 DoD에 플레이 모드 테스트를 추가합시다.” |
| **ADR** | Architecture Decision Record | 구조적 결정과 근거를 기록하는 문서 | “저장 방식 선택 이유를 ADR로 남겨두자.” |

### 기획과 제품

| 약어 | 풀어쓴 말 | 뜻 | 사용 예시 |
| --- | --- | --- | --- |
| **PoC** | Proof of Concept | 기술적 실현 가능성을 검증하는 구현 | “멀티플레이 PoC 결과를 보고 정식 구현 여부를 결정한다.” |
| **MVP** | Minimum Viable Product | 사용자에게 제공할 최소 제품 형태 | “MVP에는 핵심 플레이 루프만 포함하고 랭킹은 제외한다.” |
| **GDD** | Game Design Document | 게임의 규칙·콘텐츠·경험을 정리한 기획 문서 | “스킬 수치는 GDD와 맞는지 확인한 뒤 구현한다.” |

### 사용할 때의 약속

- 약어를 처음 쓰는 문서에서는 가능한 한 풀어쓰기를 함께 제공합니다.
- `WIP`나 `TBD`는 상태를 숨기는 말이 아니라, **무엇이 미완료·미결정인지** 명확히 하는 표기입니다.
- `LGTM`을 남기기 전에는 실제로 확인한 범위가 무엇인지 짧게 덧붙입니다.
- 약어가 대화를 어렵게 만들면 약어보다 쉬운 문장을 우선합니다.

개념 자체의 상세 설명은 [용어 사전](./glossary)에서 확인합니다.
