FROM ghcr.io/zitadel/zitadel:v4.6.4@sha256:5e14f4b43cb307973d1b6ed21b384c81d29ca986dc662a1a514806dde49d5eb0

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]