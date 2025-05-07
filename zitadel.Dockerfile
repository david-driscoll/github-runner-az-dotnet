FROM ghcr.io/zitadel/zitadel:v3.0.2@sha256:f3ac3eb4c4a145ba9facbf7d597c3974f94339453e2ffd63ffc8357f7c3439f8

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]