FROM ghcr.io/zitadel/zitadel:v2.65.1@sha256:013d23b69aa681f03d36a7fd61e4837a7b049a7e22bd7215eb3e98e9dbf5543c

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]