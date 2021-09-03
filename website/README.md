# Writing docs <!-- omit in toc -->
This is the source for ActiveAdminBootstrap documentation site. It was scaffolded with and
is currently built with [Docusaurus](https://docusaurus.io/). While some things
are documented here, most of the Docusaurus user docs lives on their site.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents <!-- omit in toc -->
- [Getting started](#getting-started)
- [Editing existing docs](#editing-existing-docs)
- [Adding a new doc](#adding-a-new-doc)
- [Docusaurus blog](#docusaurus-blog)
- [Algolia](#algolia)
- [Converting logos](#converting-logos)
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Getting started
1. Install the dependencies:
   ```bash
   $ yarn install
   ```

1. Run the dev server
   ```bash
   $ yarn start
   ```
   This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

1. Build
   ```bash
   $ yarn build
   ```
   This command generates static content into the `build` directory and can be served using any static contents hosting service.

1. Deploy
   ```bash
   $ GIT_USER=<Your GitHub username> USE_SSH=true yarn deploy
   ```
   This command is a convenient way to build the website and push to the `gh-pages` branch.

## Editing existing docs
External docs live in the `website/docs/` folder (make sure you're not adding
docs to the top-level `docs/` folder, which is for our internal docs).

For more information about docs, click
[here](https://docusaurus.io/docs/en/navigation).


## Adding a new doc
1.  Create a new markdown doc:

    ```sh
    ❯ touch docs/my-new-doc.md
    ```

1.  Initialize the doc with a header, and start writing!

    ```markdown
    ---
    id: my-new-doc
    title: My New Doc
    ---

    My content...
    ```

    The filename is what will be used for your doc's URL.
    The id is what will be used to refer to your doc in the sidebar.


## Docusaurus blog
We are using Docusaurus' blog mechanism, which is basically a set of docs with
release dates and which shows up in a separate section. For more information
about blog posts, click
[here](https://docusaurus.io/docs/en/adding-blog).

## Algolia
To create indexes on Algolia
1. Create an `.env` under the `website` directory
   ```bash
   # .env
   APPLICATION_ID=YOUR_APP_ID
   API_KEY=YOUR_API_KEY
   ```
2. run `yarn crawl`. You will need Docker and jq installed. See https://docsearch.algolia.com/docs/run-your-own for more info.

## Converting logos
The logos are located in the `static/img/` folder (i.e., at the
top-level of the repo). Logos in the website's `static/img/` folder are derived
(usually: copied) from there.

If you make changes to the logo and want to re-generate the `.ico` file, install
ImageMagick and then run:

```bash
$ convert static/img/logo.png -define icon:auto-resize static/img/favicon.ico
```