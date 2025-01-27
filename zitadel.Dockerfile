FROM ghcr.io/zitadel/zitadel:v2.68.1@sha256:74344030df8414add04f429b1748af89e1e1b2ff4de78c7d7dd5a2f76ba00074

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]