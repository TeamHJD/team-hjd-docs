import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'TeamHJD Docs',
  tagline: '함께 일하는 방식을 기록하고, 더 잘 만드는 팀의 지식 기반',
  url: 'https://teamhjd.github.io',
  baseUrl: '/team-hjd-docs/',
  organizationName: 'TeamHJD',
  projectName: 'team-hjd-docs',
  favicon: 'img/brand/favicon.svg',
  trailingSlash: false,
  onBrokenLinks: 'throw',
  markdown: {
    hooks: {
      onBrokenMarkdownLinks: 'warn',
    },
  },
  i18n: {defaultLocale: 'ko', locales: ['ko']},
  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          routeBasePath: 'docs',
          editUrl: 'https://github.com/TeamHJD/team-hjd-docs/tree/main/',
        },
        blog: false,
        theme: {customCss: './src/css/custom.css'},
      } satisfies Preset.Options,
    ],
  ],
  themeConfig: {
    colorMode: {
      defaultMode: 'light',
      respectPrefersColorScheme: true,
    },
    image: 'img/teamhjd-social-card.png',
    navbar: {
      title: 'TeamHJD Docs',
      items: [
        {to: '/docs/start-here', label: '시작하기', position: 'left'},
        {to: '/docs/collaboration/overview', label: '협업 가이드', position: 'left'},
        {to: '/docs/reference/glossary', label: '용어 사전', position: 'left'},
        {to: '/docs/reference/abbreviations', label: '약어', position: 'left'},
        {href: 'https://github.com/TeamHJD/team-hjd-docs', label: 'GitHub', position: 'right'},
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: '문서',
          items: [
            {label: '새 팀원 시작하기', to: '/docs/start-here'},
            {label: '협업 가이드', to: '/docs/collaboration/overview'},
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} TeamHJD. Built with Docusaurus.`,
    },
    prism: {
      theme: {plain: {color: '#1f2937', backgroundColor: '#f8fafc'}, styles: []},
      darkTheme: {plain: {color: '#d9f2ee', backgroundColor: '#102832'}, styles: []},
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
