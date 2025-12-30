FROM ghcr.io/zitadel/zitadel:v4.8.0@sha256:824ed359746aacc9dfdb5fe5a2cf1822853497c2cd91465523ef733ba4f783b4

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]