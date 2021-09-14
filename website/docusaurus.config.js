const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').DocusaurusConfig} */
module.exports = {
  title: 'Adminterface',
  tagline: 'An add-on that brings Bootstrap 5 and other goodies into ActiveAdmin.',
  url: 'https://cmdbrew.github.io',
  baseUrl: '/adminterface/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'cmdbrew',
  projectName: 'adminterface',
  themeConfig: {
    colorMode: {
      defaultMode: 'light',
      disableSwitch: false,
      respectPrefersColorScheme: true,
    },
    announcementBar: {
      id: 'support_us', // Any value that will identify this message.
      content: '⭐️ Adminterface is currently in public beta. <a href="https://form.typeform.com/to/EPATakNk" target="_blank" rel="noopener noreferrer">Register for the beta access</a> ⭐',
      isCloseable: false, // Defaults to `true`.
    },
    hideableSidebar: true,
    navbar: {
      hideOnScroll: true,
      title: 'Adminterface',
      logo: {
        alt: 'Adminterface',
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
        {to: 'pricing', label: 'Pricing', position: 'left'},
        {href: '/docs/intro', label: '0.1.0 🚧', position: 'right'},
        {
          href: 'https://github.com/CMDBrew/adminterface',
          position: 'right',
          className: 'header-github-link',
          'aria-label': 'GitHub repository',
        },
      ],
    },
    footer: {
      copyright: `© ${new Date().getFullYear()} <a target="_blank" rel="noopener noreferrer" href="https://www.cmdbrew.com">CMDBrew Studio, Inc.</a>`,
    },
    prism: {
      theme: lightCodeTheme,
      darkTheme: darkCodeTheme,
      additionalLanguages: ['ruby', 'erb'],
    },
    algolia: {
      apiKey: '76d7b16633a028132c432599610e1b0a',
      appId: 'HNNK67NE1P',
      indexName: 'adminterface',
      contextualSearch: false,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl:
            'https://github.com/CMDBrew/adminterface/edit/main/website/',
        },
        blog: {
          showReadingTime: true,
          editUrl:
            'https://github.com/CMDBrew/adminterface/edit/main/website/blog/',
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
