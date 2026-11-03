FROM ghcr.io/zitadel/zitadel:v4.20.1@sha256:4817dbd8896306867f28bba63e7dc3526b2d2646ac7111db9524eb3ab6e82301

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]