FROM ghcr.io/zitadel/zitadel:v3.2.3@sha256:9f16dae78b6bf4b162cacfe0d78a2319bdde26f13e3e731874056b2902b53c59

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]