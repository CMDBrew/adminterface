# Contributing <!-- omit in toc -->
- [Code of Conduct](#code-of-conduct)
- [Our Development Process](#our-development-process)
  - [Getting Started](#getting-started)
  - [Setting up the development environment](#setting-up-the-development-environment)
  - [Running test](#running-test)
  - [Linters](#linters)
  - [Conventional Commit Messages](#conventional-commit-messages)
    - [Header](#header)
    - [Body](#body)
    - [Footer](#footer)
- [License](#license)

## Code of Conduct
We've adopted a Code of Conduct that we expect project participants to adhere to. Please read the [full text](CODE_OF_CONDUCT.md) so that you can understand what actions will and will not be tolerated.

## Our Development Process
### Getting Started
1. Fork it.
2. Create a topic branch `git checkout -b my_branch`.
3. Make your changes and add an entry to [CHANGELOG.md](CHANGELOG.md).
4. Commit your changes `git commit -am "Boom"`.
5. Push to your branch `git push origin my_branch`.
6. Ensure tests pass and linter issues are resolved.
7. Ensure relevant commits are grouped and follow the [Conventional Commit Messages](#conventional-commit-messages) format.
8. Send a [pull request](https://github.com/CMDBrew/active_admin_bootstrap/pulls).

### Setting up the development environment
1. Install dependencies
   ```bash
   $ bundle exec appraisal install
   $ yarn install
   $ cd test/dummy && yarn install
   ```
2. Setup the database
   ```bash
   $ rails db:setup
   ```
3. Start up Rails and Webpacker server
   ```bash
   $ rails s
   $ cd test/dummy && ./bin/webpack-dev-server
   ```

### Running test
```bash
$ rails test
```

### Linters
We have Linters setup for:
- Javascript: https://standardjs.com
- Ruby: https://github.com/testdouble/standard
- Sass: https://stylelint.io/


### Conventional Commit Messages
- Format: `<type>(<scope>): <subject>`
- First character should be capitalized
- `<scope>` is optional

```
<type>(<scope>): <short summary>
  │       │             │
  │       │             └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │       │
  │       └─⫸ Commit Scope: animations|bazel|benchpress|common|compiler|compiler-cli|core|
  │                          elements|forms|http|language-service|localize|platform-browser|
  │                          platform-browser-dynamic|platform-server|router|service-worker|
  │                          upgrade|zone.js|packaging|changelog|docs-infra|migrations|ngcc|ve
  │
  └─⫸ Commit Type: build|ci|docs|feat|fix|perf|refactor|test

<body>

<footer>
```

#### Header
- The `<type>` and `<summary>` fields are mandatory, the `(<scope>)` field is optional.
- `<type>` must be one of the following:
  * **build**: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
  * **ci**: Changes to our CI configuration files and scripts (example scopes: Circle, BrowserStack, SauceLabs)
  * **docs**: Documentation only changes
  * **feat**: A new feature
  * **fix**: A bug fix
  * **perf**: A code change that improves performance
  * **refactor**: A code change that neither fixes a bug nor adds a feature
  * **test**: Adding missing tests or correcting existing tests

#### Body
`<body>` is optional. See https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit-body for more info

#### Footer
`<body>` is optional. See https://github.com/angular/angular/blob/master/CONTRIBUTING.md#commit-footer for more info

See more info at:
- https://www.conventionalcommits.org/
- https://github.com/angular/angular/blob/master/CONTRIBUTING.md#-commit-message-format

## License
By contributing to ActiveAdminBootstrap, you agree that your contributions will be licensed under its [License](LICENSE.md).
