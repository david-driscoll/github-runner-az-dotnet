FROM ghcr.io/zitadel/zitadel:v3.3.1@sha256:432e1d7a926b1fa31c3b873e39214fb2cc69c83b89562f988608549f2e1c1087

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]