FROM ghcr.io/zitadel/zitadel:v4.1.4@sha256:ed3109c57d3c50d57acc5fb3271b498644729c8e4f0ed2fb22fca836985f710b

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]