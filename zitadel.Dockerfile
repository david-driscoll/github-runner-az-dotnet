FROM ghcr.io/zitadel/zitadel:v3.2.2@sha256:6d3b73f80710abd4abf5344d902ad6b8cc653344a2c1c54fa01ef3fc5a22c2b0

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]