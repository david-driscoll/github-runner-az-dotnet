FROM ghcr.io/zitadel/zitadel:v2.67.0@sha256:d3130defd13d4e4250c1b5dece96aa5d0c61fdbece3001f40f29078e7a19ee02

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]