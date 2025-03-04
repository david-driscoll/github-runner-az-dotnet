FROM ghcr.io/zitadel/zitadel:v2.71.0@sha256:57203c4ef095863f5cfaad556ed37e97b5f01fd1b447343aa0fbcf7ae0d30045

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]