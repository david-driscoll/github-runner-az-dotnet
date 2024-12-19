FROM ghcr.io/zitadel/zitadel:v2.66.1@sha256:ca0285ab936a4daa2902eafdf0f8eba69daff3e63d62bef1976f47160d4c214c

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]