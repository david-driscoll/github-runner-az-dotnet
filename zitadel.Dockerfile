FROM ghcr.io/zitadel/zitadel:v2.70.0@sha256:9ff981b62b6c43559763f6bc5494d524c437580f30651018dfa16731557537b5

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]