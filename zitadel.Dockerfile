FROM ghcr.io/zitadel/zitadel:v4.6.2@sha256:15b732618b8417be3c62eb134ec883b9d108751a184318ff7c2191a219864c46

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]