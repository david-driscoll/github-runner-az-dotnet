FROM ghcr.io/zitadel/zitadel:v2.63.4

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=5 CMD exit 0
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]