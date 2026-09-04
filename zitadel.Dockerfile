FROM ghcr.io/zitadel/zitadel:v4.17.3@sha256:2ec2a42551862ca59dc752c321c7041358dea8b33b63ea5e021ec499ad5e2d9f

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]