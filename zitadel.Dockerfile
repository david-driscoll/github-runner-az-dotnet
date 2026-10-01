FROM ghcr.io/zitadel/zitadel:v4.19.4@sha256:90a3045b80a2b5b395e1e770302076906af3a5911225af7c464b4f3bd00d0a1b

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]