---
sidebar_position: 1
title: Pull Request와 리뷰
tags: [중요, pull-request, review]
---

# Pull Request와 리뷰

> **중요도: 중요** · PR을 만들거나 리뷰를 요청받았을 때 읽습니다.

Pull Request는 Merge 요청만이 아닙니다. 변경의 목적을 공유하고, 다른 팀원이 안전성과 이해도를 함께 확인하는 대화의 단위입니다.

## PR을 열기 전 확인

- 변경 목적과 Issue 연결이 보이는가?
- 리뷰어가 확인할 수 있도록 변경 범위가 적절한가?
- 테스트 또는 확인 방법을 적었는가?
- 아직 작업 중이라면 Draft PR로 열었는가?

## 리뷰에서 보는 것

정확성, 읽기 쉬움, 책임의 분리, 중복, 예외 상황, 회귀 가능성을 우선 확인합니다. Unity 프로젝트라면 `.meta` 파일과 에셋 변경도 함께 살핍니다.

Merge 전 자동 검증은 [품질 확인](./quality-checks)으로 이어집니다.
