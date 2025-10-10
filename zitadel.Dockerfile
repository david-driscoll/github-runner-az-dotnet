FROM ghcr.io/zitadel/zitadel:v4.3.2@sha256:67477133deb9b0441af0aa1c6d5a6a02782414cc434efe29ec2e1678a8a1ba78

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]