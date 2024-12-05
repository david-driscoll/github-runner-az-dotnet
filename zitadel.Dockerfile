FROM ghcr.io/zitadel/zitadel:v2.65.3@sha256:8ad80769c463dc83302fb1b337417ac785222bad8081bf3bc63539f50c091c28

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]