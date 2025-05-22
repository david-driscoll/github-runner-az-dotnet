FROM ghcr.io/zitadel/zitadel:v3.1.0@sha256:d2db1f83de406b5704762ea48b288d55931d1c21b6e76071c09aa01c18b27e71

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]