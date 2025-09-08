FROM ghcr.io/zitadel/zitadel:v4.1.3@sha256:c3e64aee8f3616846bd0c38a011036429daf6188d47fd65bbd18666a2da37701

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]