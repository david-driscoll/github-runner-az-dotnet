FROM ghcr.io/zitadel/zitadel:v4.7.6@sha256:182c062408cae95fa7cfe6995bd8f0372770c1694a2ad6b5245042b629c1f983

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]