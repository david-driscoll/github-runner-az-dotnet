FROM ghcr.io/zitadel/zitadel:v3.0.0@sha256:fe5371eac4f49695ad9488367809bba7b3bba389c218836acfca39ec49701872

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]