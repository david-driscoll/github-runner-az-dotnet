FROM ghcr.io/zitadel/zitadel:v4.12.3@sha256:778a4240ee06cd3e292019d364d3de07821d4a0068efc20900d23bebfea66efb

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]