# Contributing <!-- omit in toc -->
- [Code of Conduct](#code-of-conduct)
- [Our Development Process](#our-development-process)
  - [Getting Started](#getting-started)
  - [Setting up the development environment](#setting-up-the-development-environment)
  - [Running test](#running-test)
  - [Linters](#linters)
  - [Semantic Commit Messages](#semantic-commit-messages)
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
7. Ensure relevant commits are grouped and follow the [Semantic Commit Messages](#semantic-commit-messages) format.
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


### Semantic Commit Messages
- Format: `<type>(<scope>): <subject>`
- First character should be capitalized
- `<scope>` is optional

```
Feat: add hat wobble
^--^  ^------------^
|     |
|     +-> Summary in present tense.
|
+-------> Type: Chore, Docs, Feat, Fix, Refactor, Style, or Test.
```

More Examples:

- `Feat`: (new feature for the user, not a new feature for build script)
- `Fix`: (bug fix for the user, not a fix to a build script)
- `Docs`: (changes to the documentation)
- `Style`: (formatting, missing semi colons, etc; no production code change)
- `Refactor`: (refactoring production code, eg. renaming a variable)
- `Test`: (adding missing tests, refactoring tests; no production code change)
- `Chore`: (updating grunt tasks etc; no production code change)

References:

- https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716
- https://www.conventionalcommits.org/
- https://seesparkbox.com/foundry/semantic_commit_messages
- http://karma-runner.github.io/1.0/dev/git-commit-msg.html

## License
By contributing to ActiveAdmin Bootstrap, you agree that your contributions will be licensed under its [License](LICENSE.md).
