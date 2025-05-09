FROM ghcr.io/zitadel/zitadel:v3.0.4@sha256:316ef5a48064fb29efb4f1e9183460dbe0d11e26d1319152fb58494e5447005a

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]