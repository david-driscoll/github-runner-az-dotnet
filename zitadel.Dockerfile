FROM ghcr.io/zitadel/zitadel:v2.71.5@sha256:871301f51a0d80a9307622d321784ee8ee8adb5e96242032688c65c2a99e8ecf

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]