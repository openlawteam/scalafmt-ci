FROM mrothy/scalafmt-native:2.0.1

LABEL "com.github.actions.name"="Scalafmt"
LABEL "com.github.actions.description"="Lint code formatting with scalafmt"
LABEL "com.github.actions.icon"="wind"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="https://github.com/openlawteam/scalafmt-ci"
LABEL "homepage"="https://github.com/openlawteam/scalafmt-ci"
LABEL "maintainer"="Matthew Rothenberg <mroth@openlaw.io>"

ENTRYPOINT ["/app/scalafmt", "--non-interactive", "--list"]
# by default, github actions will set WORKDIR to $GITHUB_WORKSPACE 
# (/github/workspace), so no need to set CMD here
