FROM ghcr.io/zitadel/zitadel:v4.11.1@sha256:a9f1ed98e0ab7f98cadecab90a47226b735ffad3ed0f318abd7817839518fb1a

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]