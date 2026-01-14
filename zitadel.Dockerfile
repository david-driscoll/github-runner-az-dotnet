FROM ghcr.io/zitadel/zitadel:v4.9.1@sha256:2a7317d98b933cde3586c40b8dfc0a5f472174f78816095bded5107e646dfb25

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]