FROM ghcr.io/zitadel/zitadel:v4.19.5@sha256:a586456a208e0db4c633db0ba43c427c24b37846138b8b13ff16ad8e003a18d3

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]