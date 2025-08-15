FROM ghcr.io/zitadel/zitadel:v4.0.2@sha256:66f3813f8a5f995ab6c57cde62072344f7d8ab9dd2a9efef00f8bb277b883087

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]