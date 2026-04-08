import type { Config } from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'WebBank Tutorial',
  tagline: 'Learn Flutter web accessibility by building a banking dashboard',
  favicon: 'img/favicon.ico',

  url: 'https://webbank-tutorial.dev',
  baseUrl: '/',

  organizationName: 'team360r',
  projectName: 'WebBank',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  markdown: {
    mermaid: true,
  },

  themes: ['@docusaurus/theme-mermaid'],

  presets: [
    [
      'classic',
      {
        docs: {
          routeBasePath: '/',
          sidebarPath: './sidebars.ts',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    navbar: {
      title: 'WebBank Tutorial',
      items: [
        {
          href: 'https://github.com/team360r/WebBank',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      copyright: `Built with Flutter & Docusaurus.`,
    },
    prism: {
      additionalLanguages: ['dart', 'bash', 'yaml', 'json'],
    },
    colorMode: {
      respectPrefersColorScheme: true,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
