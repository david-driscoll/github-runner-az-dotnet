FROM ghcr.io/zitadel/zitadel:v2.69.3@sha256:a0005620f22dee581493807923a7abf52675fe2e8fc81e8c9a42a5f94040b562

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]