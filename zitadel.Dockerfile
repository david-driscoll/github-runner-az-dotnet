FROM ghcr.io/zitadel/zitadel:v4.0.0@sha256:3ee98baa421c4c7e3afea80acadcb742bebf10bc1427a18271dd79c6a438700e

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]