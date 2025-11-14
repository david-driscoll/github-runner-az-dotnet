FROM ghcr.io/zitadel/zitadel:v4.7.0@sha256:06d77bfb26d50772de46cba8efb9b157d3f26ab9fa66d62dacf383322a6b2ef1

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]