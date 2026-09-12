---
sidebar_position: 2
title: 품질 확인과 Merge
tags: [중요, ci, merge]
---

# 품질 확인과 Merge

> **중요도: 중요** · Merge 직전에 확인합니다.

PR의 승인과 CI 통과는 서로 다른 확인입니다. 리뷰는 사람이 변경의 의도와 품질을 확인하고, CI는 정해진 자동 검증을 반복 가능하게 실행합니다.

## Merge 전 질문

- 리뷰에서 나온 요청이 모두 반영되었는가?
- 필요한 Status Check가 통과했는가?
- 변경이 원래 Issue의 완료 조건을 만족하는가?
- Merge 전략이 저장소 규칙과 맞는가?

이 기준은 [팀 작업 약속](../team/working-agreements)에서 팀 상황에 맞춰 구체화합니다.
