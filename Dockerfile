# This is essentially just scalafmt loaded into an alpine container, so
# that we have a shell present to expand wildcards etc.
FROM mrothy/scalafmt:2.3.2 as scalafmt

FROM eclipse-temurin:11-jre

COPY --from=scalafmt /usr/local/bin/scalafmt /usr/local/bin/scalafmt
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--list"]
