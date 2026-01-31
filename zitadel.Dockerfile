FROM ghcr.io/zitadel/zitadel:v4.10.1@sha256:13072d0eedb9f0d16df0fc4411e75da5abd7f9bf148c9e109a972463087a0b32

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]