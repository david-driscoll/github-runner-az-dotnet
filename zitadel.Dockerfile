FROM ghcr.io/zitadel/zitadel:v2.67.2@sha256:90dc5231c14cd08781641f49b292356b4e16d2ba8435dd75019e57a861e982f9

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]