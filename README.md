# Scalafmt GitHub Action

Runs `scalafmt --list` on your repository automatically with every push.

Uses [scalafmt-native](https://github.com/mroth/scalafmt-native) under the hood to keep things small and booting super quick by avoiding the JVM. :racehorse:

## :warning: Note 

This currently uses the beta version of GitHub Actions, and will need to be updated to reflect the upcoming release version _(just as soon we are given access to it!)_. 

## Usage

### Installing with GitHub

1. Follow the GitHub Actions documentation to [Create a Workflow and Add an Action](https://help.github.com/en/articles/creating-a-workflow-with-github-actions).
2. Enter `openlawteam/scalafmt-ci@0.1.0`, pinning to whichever release version you like.
3. _(Optional)_ If you wish to pass any additional arguments to scalafmt, simply add them to the "args" field.

### Configuring manually

If you prefer editing your `main.workflow` files by hand, use an action block like this:

```hcl
action "lint" {
  uses="openlawteam/scalafmt-ci@0.1.0"
  # optional additional args
  args="--exclude ./vendor"
}
```

