FROM ghcr.io/zitadel/zitadel:v2.66.0@sha256:0c1d1a65e3dade27dbe5fde2ed20c79a046754bea47c9dcd1a4d69917195256f

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]