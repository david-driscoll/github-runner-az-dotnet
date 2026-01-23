FROM ghcr.io/zitadel/zitadel:v4.10.0@sha256:ccbed9dd5b88ecc3e29ab5b1c19e2250871ce1010c8fc06d312a9a9e71ca1283

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]