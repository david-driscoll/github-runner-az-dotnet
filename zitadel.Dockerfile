FROM ghcr.io/zitadel/zitadel:v3.2.0@sha256:6b1bd27a2374cb797c0d47cadbffb2037d70b375fc4b3ce368194ce1ba95c966

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]