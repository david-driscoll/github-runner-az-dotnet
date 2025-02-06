FROM ghcr.io/zitadel/zitadel:v2.69.2@sha256:2ea35beccdf9d47cbfb9676fbf531145b074cd4aec5b2a1a7c16995593222598

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]