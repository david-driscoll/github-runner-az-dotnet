FROM ghcr.io/zitadel/zitadel:v3.2.1@sha256:10823a2c40cbcb25cfe1cbcdcf7fd41c9936ba5d0ff4bc0cfecc16016deb03ce

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]