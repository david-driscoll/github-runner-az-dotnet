FROM ghcr.io/zitadel/zitadel:v2.69.1@sha256:af1d75e6349d507a7bad6fbc717a98c609064e1dc9c18c4d379aba072b129f9c

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]