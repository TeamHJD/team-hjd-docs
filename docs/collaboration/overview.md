---
sidebar_position: 1
title: 협업의 전체 흐름
tags: [필수, collaboration, github]
---

# 협업의 전체 흐름

> **중요도: 필수** · 작업을 시작하기 전에 이 페이지부터 읽습니다.

TeamHJD의 기본 작업 단위는 “코드를 작성했다”가 아니라, **요청된 변경이 검토와 검증을 거쳐 팀 프로젝트에 반영되었다**입니다.

```text
Issue → Branch → Development → Commit / Push → Pull Request → Review → CI → Merge → Done
```

| 단계 | 질문 | 다음 문서 |
| --- | --- | --- |
| Issue | 왜, 무엇을 바꾸는가? | [GitHub 작업 흐름](./github-flow) |
| Branch | 다른 작업과 어떻게 분리하는가? | [Git 기초](./git-basics) |
| Pull Request | 변경을 어떻게 공유하는가? | [PR과 리뷰](../delivery/pull-request) |
| CI / Merge | 안전하게 반영할 준비가 되었는가? | [품질 확인](../delivery/quality-checks) |

## 이 순서가 중요한 이유

각 단계는 다음 사람에게 필요한 맥락을 남깁니다. Issue는 목적을, Branch와 Commit은 작업 이력을, PR은 논의와 검증 결과를 기록합니다. 이 기록이 있어야 팀이 멈추지 않고 이어서 작업할 수 있습니다.

## 지금 할 일

- 처음 참여했다면: [Git 기초](./git-basics)로 이동합니다.
- 작업을 이미 시작했다면: [GitHub 작업 흐름](./github-flow)에서 현재 단계를 확인합니다.
- PR을 열 준비가 되었다면: [PR과 리뷰](../delivery/pull-request)를 확인합니다.
