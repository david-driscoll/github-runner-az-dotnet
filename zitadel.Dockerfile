FROM ghcr.io/zitadel/zitadel:v4.3.0@sha256:953e68d9ce02fff2836e416cd1dd96c8b4e3164e2d3d5d057e41b45398518707

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]