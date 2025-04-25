FROM ghcr.io/zitadel/zitadel:v2.71.8@sha256:bdabd8fa2ad92f82aa524d3e1d4ead63446be2950499948436685876e72e7a63

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]