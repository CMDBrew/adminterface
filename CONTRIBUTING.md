# Contributing
Adminterface is currently under development. We have early adopters who already started using it. We welcome contributors to collaborate to shape the future of Adminterface.

The Open Source Guides website has a collection of resources for individuals, communities, and companies who want to learn how to run and contribute to an open source project. Contributors and people new to open source alike will find the following guides especially useful:
- [How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
- [Building Welcoming Communities](https://opensource.guide/building-community/)

## Code of Conduct
We've adopted a Code of Conduct that we expect project participants to adhere to. Please [read the full text](https://cmdbrew.github.io/adminterface/code-of-conduct) so that you can understand what actions will and will not be tolerated.

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

## License
By contributing to Adminterface, you agree that your contributions will be licensed under its [License](https://cmdbrew.github.io/adminterface/license).
