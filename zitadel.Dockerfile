FROM ghcr.io/zitadel/zitadel:v4.3.3@sha256:da140c271dccc84e455fb40e3210ef77624ead74726183526584aa3ecf5c9a07

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]