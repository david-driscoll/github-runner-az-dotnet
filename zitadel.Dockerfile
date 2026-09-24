FROM ghcr.io/zitadel/zitadel:v4.19.1@sha256:f98935f56505ec6fa3e6523261cd1b8ace0c622e16da4a45acd493cb472f003f

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]