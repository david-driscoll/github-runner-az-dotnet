FROM ghcr.io/zitadel/zitadel:v4.9.0@sha256:7475b0b7fc7dd2ccf6486a44a6f4edae0e82a430f35561898b35c0e687378623

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]