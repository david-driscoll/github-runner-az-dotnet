FROM ghcr.io/zitadel/zitadel:v4.12.1@sha256:c08f5f84dcf94c8445f6930758cb11c96bf80f75ac86f3f4588c8de22de4c6b5

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]