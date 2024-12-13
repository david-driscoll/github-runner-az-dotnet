FROM ghcr.io/zitadel/zitadel:v2.65.4@sha256:e88c715769bc51edfab00804bbd672cbf24b470ab58b709b8fd5e70afdae3639

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]