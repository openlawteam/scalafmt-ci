# This is essentially just scalafmt-native loaded into an alpine container, so
# that we have a shell present to expand wildcards etc.
FROM mrothy/scalafmt-native:2.2.2 as scalafmt-native

FROM alpine:latest
LABEL "repository"="https://github.com/openlawteam/scalafmt-ci"
LABEL "homepage"="https://github.com/openlawteam/scalafmt-ci"
LABEL "maintainer"="Matthew Rothenberg <mroth@openlaw.io>"

COPY --from=scalafmt-native /app/scalafmt /usr/local/bin/scalafmt
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--list"]
