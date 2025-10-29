FROM ghcr.io/zitadel/zitadel:v4.6.1@sha256:4f10b477510a148cf96da3ff4259a0dc9ffadd4b0d819898d91926a98491b977

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]