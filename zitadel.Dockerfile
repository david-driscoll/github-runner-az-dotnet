FROM ghcr.io/zitadel/zitadel:v2.71.9@sha256:164937018ace71b77f7c0de609dffcdd0f3ff6779700f1982029e045088c5c74

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]