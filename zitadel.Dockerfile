FROM ghcr.io/zitadel/zitadel:v2.69.0@sha256:ebfb0fecbc7844f48e12f60fccf18ebc664f2687a482b411612e7f8690993fe9

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]