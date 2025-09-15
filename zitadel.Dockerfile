FROM ghcr.io/zitadel/zitadel:v4.2.0@sha256:4582be1a9eeae5823aad17f58a58746696c43bcc09851364f0028077ebcadadf

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]