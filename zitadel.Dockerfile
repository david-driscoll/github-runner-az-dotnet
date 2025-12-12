FROM ghcr.io/zitadel/zitadel:v4.7.5@sha256:5e90a7bb9b94ba1d403e19aaab5f401f2d0ff7d7591900a18624a25da5e00b91

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]