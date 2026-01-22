FROM ghcr.io/zitadel/zitadel:v4.9.2@sha256:c9694dfa06a8c841454530e75478724671260096a0356effa151de451bea0f2b

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]