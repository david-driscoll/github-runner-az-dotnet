FROM ghcr.io/zitadel/zitadel:v4.4.0@sha256:3e5191e7245ec64f516024a34cfdb6dd3fc0f0fe562a63627702e72ae16ab1d1

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]