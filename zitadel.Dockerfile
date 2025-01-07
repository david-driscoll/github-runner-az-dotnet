FROM ghcr.io/zitadel/zitadel:v2.67.1@sha256:6500dc12632f7e54005ae74cafdb14c1888e48c7d5dda934ce6d6633484a4de9

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]