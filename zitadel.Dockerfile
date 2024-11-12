FROM ghcr.io/zitadel/zitadel:v2.65.0@sha256:c55629faa8c6b83ee2ea878e9716cbc344c42dc54dba7f8d835ec4ff43ccfdc4

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]