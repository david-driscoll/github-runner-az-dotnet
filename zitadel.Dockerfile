FROM ghcr.io/zitadel/zitadel:v2.71.2@sha256:51d449e613629b63630bf5f56111f037e1fc553a8622f6e1b23758987c36e23c

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]