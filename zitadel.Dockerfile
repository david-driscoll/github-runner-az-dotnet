FROM ghcr.io/zitadel/zitadel:v4.6.6@sha256:ff380e0fb7feafe32f65f00842a33c13953023c905d870f121516de0e482fa9b

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]