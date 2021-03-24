FROM scalameta/scalafmt:v2.7.5 as scalafmt-native

FROM alpine:latest
LABEL "repository"="https://github.com/openlawteam/scalafmt-ci"
LABEL "homepage"="https://github.com/openlawteam/scalafmt-ci"
LABEL "maintainer"="Matthew Rothenberg <mroth@openlaw.io>"

COPY --from=scalafmt-native /bin/scalafmt /bin/scalafmt
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--list"]
