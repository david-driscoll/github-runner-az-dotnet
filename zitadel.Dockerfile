FROM ghcr.io/zitadel/zitadel:v2.66.3@sha256:677b32f1f18a2e1458a0ab4f64761a9949aba868414d7cd7ea07edefe2366d7f

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]