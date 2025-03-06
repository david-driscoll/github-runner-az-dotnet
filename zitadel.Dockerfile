FROM ghcr.io/zitadel/zitadel:v2.71.1@sha256:d635c311d21fc8d314d2d1fea428af94335604b74667a8a92650f398b6214547

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]