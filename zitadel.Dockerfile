FROM ghcr.io/zitadel/zitadel:v4.12.0@sha256:1ce77dc6b773dc80ee01727a908443331ec79a9c113a212828e4e35201c01cb1

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]