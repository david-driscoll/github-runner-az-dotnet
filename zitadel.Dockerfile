FROM ghcr.io/zitadel/zitadel:v4.0.1@sha256:8a85962f61c540b51c93e0690c918ff722a7cc94de7f4ed864ce27125a38293c

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]