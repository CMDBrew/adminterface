const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').DocusaurusConfig} */
module.exports = {
  title: 'ActiveAdminBootstrap',
  tagline: 'Enhance ActiveAdmin with Bootstrap 5 and extended functionalities.',
  url: 'https://cmdbrew.github.io',
  baseUrl: '/active_admin_bootstrap/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'cmdbrew',
  projectName: 'active_admin_bootstrap',
  themeConfig: {
    announcementBar: {
      id: 'support_us', // Any value that will identify this message.
      content: '⭐️ ActiveAdminBootstrap is currently in beta. Reach out to us at contact@cmdbrew.com if you want to become an early adopter ⭐',
      isCloseable: false, // Defaults to `true`.
    },
    hideableSidebar: true,
    navbar: {
      hideOnScroll: true,
      title: 'ActiveAdminBootstrap',
      logo: {
        alt: 'ActiveAdminBootstrap',
        src: 'img/logo.png',
        href: '/'
      },
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'left',
          label: 'Docs',
        },
        {
          to: '/community/support',
          label: 'Community',
          position: 'left',
          activeBaseRegex: `/community/`,
        },
        {
          href: 'https://github.com/CMDBrew/active_admin_bootstrap',
          position: 'right',
          className: 'header-github-link',
          'aria-label': 'GitHub repository',
        },
      ],
    },
    footer: {
      style: 'dark',
      logo: {
        alt: 'CMDBrew Studio Inc',
        src: 'img/cmdbrew-logo.svg',
        href: 'https://www.cmdbrew.com',
      },
      copyright: `Copyright © ${new Date().getFullYear()} CMDBrew Studio, Inc. Built with Docusaurus.`,
    },
    prism: {
      theme: lightCodeTheme,
      darkTheme: darkCodeTheme,
      additionalLanguages: ['ruby', 'erb'],
    },
    algolia: {
      apiKey: '76d7b16633a028132c432599610e1b0a',
      appId: 'HNNK67NE1P',
      indexName: 'cmdbrew_active_admin_bootstrap',
      contextualSearch: false,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          // Please change this to your repo.
          editUrl:
            'https://github.com/CMDBrew/active_admin_bootstrap/edit/main/website/',
        },
        blog: {
          showReadingTime: true,
          // Please change this to your repo.
          editUrl:
            'https://github.com/CMDBrew/active_admin_bootstrap/edit/main/website/blog/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.scss'),
        },
      },
    ],
  ],
  plugins: [
    'docusaurus-plugin-sass',
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'community',
        path: 'community',
        routeBasePath: 'community',
        sidebarPath: require.resolve('./sidebarsCommunity.js'),
      },
    ],
  ],
};
