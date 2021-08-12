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
    navbar: {
      title: 'ActiveAdminBootstrap',
      logo: {
        alt: 'ActiveAdminBootstrap',
        src: 'img/logo.png',
        href: 'docs/intro'
      },
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'left',
          label: 'Docs',
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
      copyright: `Copyright © ${new Date().getFullYear()} CMDBrew Studio, Inc. Built with Docusaurus.`,
    },
    prism: {
      theme: lightCodeTheme,
      darkTheme: darkCodeTheme,
      additionalLanguages: ['ruby'],
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
            'https://github.com/CMDBrew/active_admin_bootstrap/edit/master/website/',
        },
        blog: {
          showReadingTime: true,
          // Please change this to your repo.
          editUrl:
            'https://github.com/CMDBrew/active_admin_bootstrap/edit/master/website/blog/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
