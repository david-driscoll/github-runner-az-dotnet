FROM ghcr.io/zitadel/zitadel:v4.13.0@sha256:fbbe11f3ec190d7147e5e3d650f5d9aaeba822b1e6dcb63d9b946166c32b7c83

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]