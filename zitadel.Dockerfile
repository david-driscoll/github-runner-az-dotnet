FROM ghcr.io/zitadel/zitadel:v4.11.0@sha256:74bdb4f9a806cced80677d34c548e46f48dac03bd4835a198e7db5bb1ac33884

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]