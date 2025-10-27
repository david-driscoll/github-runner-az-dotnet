FROM ghcr.io/zitadel/zitadel:v4.5.0@sha256:8c1d272b922569e2d6fca81480aeddd4d0060c63bf9efde3b47ac4df1449d604

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]