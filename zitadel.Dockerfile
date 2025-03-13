FROM ghcr.io/zitadel/zitadel:v2.71.3@sha256:8314337e206f9f7a8bba7a301a87c55d269bcda2ac39c9bae62ed8fce0d100f1

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]