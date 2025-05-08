FROM ghcr.io/zitadel/zitadel:v3.0.3@sha256:1710641da6c7ccd733bd372fe32c17d7ebe9a55d658277bd3315f76c58e355ed

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]