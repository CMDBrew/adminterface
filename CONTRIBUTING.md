# Contributing <!-- omit in toc -->
- [Getting Started](#getting-started)
- [Setting up the development environment](#setting-up-the-development-environment)
- [Running test](#running-test)
- [Linters](#linters)

## Getting Started
1. Fork it.
2. Create a topic branch `git checkout -b my_branch`.
3. Make your changes and add an entry to [CHANGELOG.md](CHANGELOG.md).
4. Commit your changes `git commit -am "Boom"`.
5. Push to your branch `git push origin my_branch`.
6. Ensure tests pass and linter issues are resolved.
6. Send a [pull request](https://github.com/CMDBrew/active_admin_bootstrap/pulls).

## Setting up the development environment
1. Install dependencies
```bash
$ bundle install
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

## Running test
```bash
$ rails test
```

## Linters
We have Linters setup for:
- Javascript: https://standardjs.com
- Ruby: https://github.com/testdouble/standard
- Sass: https://stylelint.io/
