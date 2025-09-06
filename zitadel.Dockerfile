FROM ghcr.io/zitadel/zitadel:v4.1.2@sha256:d80d3d377bfa9bbc0fe2f584690614fb2544a5b21c150c61a87912b34d90c4cd

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]