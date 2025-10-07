FROM ghcr.io/zitadel/zitadel:v4.3.1@sha256:0a4773f1b2213cffe94792af00b9d1736e4aca66795cb4cc8a2370904a835c4e

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]