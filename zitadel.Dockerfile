FROM ghcr.io/zitadel/zitadel:v4.7.1@sha256:8e5cc1bec9902f1d6ea045665022a55df2ed97c4b01f6eeec39d852c565fb7cb

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]