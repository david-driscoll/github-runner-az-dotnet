FROM ghcr.io/zitadel/zitadel:v4.13.1@sha256:86c67c020e6e21608c7058813758aeb878a86eeef82a09544e03e74da9a2f6f0

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]