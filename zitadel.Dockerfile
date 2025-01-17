FROM ghcr.io/zitadel/zitadel:v2.67.4@sha256:8398dfa77d00e36982f84ad9a04bad3e9eeca474bd7ef602468c0efd8f51190d

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]