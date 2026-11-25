FROM ghcr.io/zitadel/zitadel:v4.20.6@sha256:169179455987c52d89c6c719bcd2871d6797e8a8df7c44396cd96d34eec56363

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]