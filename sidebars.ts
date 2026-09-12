import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {
  docs: [
    'start-here',
    {
      type: 'category',
      label: '01. 협업의 흐름',
      collapsed: false,
      items: [
        'collaboration/overview',
        'collaboration/git-basics',
        'collaboration/github-flow',
        'collaboration/unity-team-collaboration-guide',
      ],
    },
    {
      type: 'category',
      label: '02. 작업을 끝까지 보내기',
      collapsed: false,
      items: ['delivery/pull-request', 'delivery/quality-checks'],
    },
    {
      type: 'category',
      label: '03. 팀의 지식',
      collapsed: true,
      items: ['team/working-agreements', 'team/onboarding', 'team/document-contribution'],
    },
    {
      type: 'category',
      label: '레퍼런스',
      collapsed: true,
      items: ['reference/priority-guide', 'reference/glossary'],
    },
  ],
};

export default sidebars;
