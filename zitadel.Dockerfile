FROM ghcr.io/zitadel/zitadel:v3.3.0@sha256:2763db7f99d4e22cc56c189e674bb2781976c5d6c467b5c85ae83b9292ac51eb

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]