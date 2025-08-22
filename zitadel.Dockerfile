FROM ghcr.io/zitadel/zitadel:v4.0.3@sha256:98a3346a05cb959431a2800096d15768a71410b6027954f1c751eb7fae03ff6f

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]