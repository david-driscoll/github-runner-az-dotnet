FROM ghcr.io/zitadel/zitadel:v2.71.7@sha256:3235a9d119dce29c2336dbe28e8137130f2bc4fb4544a6e73a240e20abac604c

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]