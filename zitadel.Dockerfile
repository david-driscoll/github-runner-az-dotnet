FROM ghcr.io/zitadel/zitadel:v3.3.2@sha256:27ac010816bf07d7d3c08ac61d470edfdf771f58aa0836909d0383aaca8fd72b

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]