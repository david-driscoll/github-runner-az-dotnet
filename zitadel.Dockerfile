FROM ghcr.io/zitadel/zitadel:v2.71.6@sha256:43a4f61cebd872789a0a4d40309e3c2d7e3b407d9f9f311e88724bf35c0778ef

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]