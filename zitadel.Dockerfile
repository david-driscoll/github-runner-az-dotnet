FROM ghcr.io/zitadel/zitadel:v4.15.0@sha256:cc9fb3b2788dcbd0dff93781a0323bbe491a4cec11e1caefd9a1ed31f7fdc145

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]