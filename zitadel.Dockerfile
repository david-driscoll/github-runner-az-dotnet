FROM ghcr.io/zitadel/zitadel:v2.66.2@sha256:24e40f37c0dac4efa34a07c82d0f7402414a07e5310f96f3740a5ff4fa3b6081

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]