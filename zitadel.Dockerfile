FROM ghcr.io/zitadel/zitadel:v2.68.0@sha256:9e0e672e4467fd5b1ad07acf206d61e096886e44ca1347c2deef8b65f8ace2b5

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]