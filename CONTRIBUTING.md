# Contributing
Adminterface is currently under development. We have early adopters who already started using it. We welcome contributors to collaborate to shape the future of Adminterface.

The Open Source Guides website has a collection of resources for individuals, communities, and companies who want to learn how to run and contribute to an open source project. Contributors and people new to open source alike will find the following guides especially useful:
- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
- [Building Welcoming Communities](https://opensource.guide/building-community/)

## Code of Conduct
We've adopted a Code of Conduct that we expect project participants to adhere to. Please [read the full text](https://adminterface.io/code-of-conduct) so that you can understand what actions will and will not be tolerated.

## Contributing to the code
### Installation
1. Clone the repo
2. Install dependencies
  ```bash
  $ bundle exec appraisal install
  $ yarn install
  $ cd test/dummy && yarn install
  ```
3. Setup the database
  ```bash
  $ rails db:setup
  ```
4. Start up Rails and Webpacker server
  ```bash
  $ rails s
  $ cd test/dummy && ./bin/webpack-dev-server
  ```

### Conventional Commit Messages
- Format: `<type>(<scope>): <subject>`
- `<scope>` is optional

```
<type>: <subject>
^----^  ^------------^
|       |
|       +-> Summary in present tense. Not capitalized. No period at the end.
|
+-------> Type: See types below.
```

The various types of commits:

| Type       | Description
| :--------- | :------------------
| `build`    | Changes that affect the build system or external dependencies
| `ci`       | Changes to our CI configuration files and scripts
| `docs`     | Documentation only changes
| `feat`     | A new feature
| `fix`      | A bug fix
| `perf`     | A code change that improves performance
| `refactor` | A code change that neither fixes a bug nor adds a feature
| `test`     | Adding missing tests or correcting existing tests
| `chore`    | Anything else without production code change

See more info at:
- https://www.conventionalcommits.org/
- https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-format

### Pull request
:::tip
Your first Pull Request? First, take a look at the [How to Contribute to an Open Source Project on GitHub](https://egghead.io/courses/how-to-contribute-to-an-open-source-project-on-github) guide.
:::

If you decided to contribute to our source, we appreciate your time and will do our best to work with you and get your PR reviewed.

1. Fork it.
2. Create a topic branch `git checkout -b my_branch`.
3. Commit your changes `git commit -am "Boom"`.
4. Push to your branch `git push origin my_branch`.
5. Ensure tests pass (`rails test`) and linter issues (`standard` and `yarn lint`) are resolved.
6. Ensure relevant commits are grouped and follow the [Conventional Commit Messages](#conventional-commit-messages) format.
7. Send a [pull request](https://github.com/CMDBrew/adminterface/pulls).

## Release Candidates
Adminterface hosts release candidate builds on Github packages. If you wish to test a pre-publish build, please follow the steps below:

### Installation
1. Add the following to your application's Gemfile:
   ```ruby
   source "https://rubygems.pkg.github.com/cmdbrew" do
     # Replace [VERSION] with the target RC version
     gem "adminterface", [VERSION]
   end
   ```
2. Then execute:
   ```bash
   $ bundle install
   ```
3. Add an `.npmrc` file and add the following line
   ```shell
   @cmdbrew:registry=https://npm.pkg.github.com
   ```
4. Install ActiveAdmin (If you haven't)
   ```bash
   $ rails g active_admin:install --use_webpacker
   ```
5. Install Adminterface
   ```bash
   $ rails g adminterface:install
   ```
6. Migrate your database and start the server
   ```bash
   $ rails db:migrate
   $ rails server
   ```

### Upgrading
1. Replace `$VERSION` with the target RC version.
   ```ruby
   source "https://rubygems.pkg.github.com/cmdbrew" do
     gem "adminterface", "$VERSION"
   end
   ```
2. Run `bundle install`
3. Replace `$VERSION` with the target RC version, and run:
   ```bash
   yarn upgrade @cmdbrew/adminterface@$VERSION
   ```

## Releasing (maintainers only)
We use Github Actions to publish releases based on the git tags automatically. See [`.github/workflows/release.yml`](https://github.com/CMDBrew/adminterface/.github/workflows/release.yml) for more information.
1. Update Gem version in [`lib/adminterface/version.rb`](https://github.com/CMDBrew/adminterface/lib/adminterface/version.rb)
2. Update NPM package version in [`package.json`](https://github.com/CMDBrew/adminterface/package.json)
3. Update doc version in [`website/docusaurus.config.js`](https://github.com/CMDBrew/adminterface/website/docusaurus.config.js)
4. Run `yarn release` to update license dependencies
5. Create a tag using git and push it to the repo
   ```bash
   version="v0.x.x"
   git tag ${version}
   git push origin ${version}
   ```

## License
By contributing to Adminterface, you agree that your contributions will be licensed under its [License](https://adminterface.io/docs/terms).
