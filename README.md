# Scalafmt GitHub Action

Runs `scalafmt --list` on your repository automatically with every push.

Uses [scalafmt-native](https://scalameta.org/scalafmt/docs/installation.html#native-image)
under the hood to keep things small and booting super quick by avoiding the JVM. :racehorse:

## Usage

Simply add a step such as the following to your your workflow yml file:

```yml
- name: Check for scalafmt conformance
  uses: openlawteam/scalafmt-ci@v2
```

Example in the full context of a workflow file, with some optional arguments:

```yml
name: Check scalafmt on push
on: [push]

jobs:
  scalafmt-lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
        with:
          fetch-depth: 1
      - name: Checking your code to see if u r naughty or nice
        uses: openlawteam/scalafmt-ci@v2
        with:
          args: "--exclude=third_party --list"
```

### Installing with GitHub Marketplace

https://github.com/marketplace/actions/scalafmt-action

### (Legacy) HCL Syntax

If you are still using legacy HCL format (from the GitHub Actions Alpha test),
you will need to pin to a previous version of this action.

```hcl
action "lint" {
  uses="openlawteam/scalafmt-ci@v0"
  # optional additional args
  args="--exclude ./vendor"
}
```
