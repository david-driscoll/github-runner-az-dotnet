FROM ghcr.io/zitadel/zitadel:v2.71.4@sha256:f8b0922bc0ce35200d2946b0db984d8ff9448698773c76e664143f28f43b384a

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]