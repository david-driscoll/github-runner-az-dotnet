FROM ghcr.io/zitadel/zitadel:v4.7.2@sha256:e25c5d590e8b8f775d1b818e44a33a9e3955ebca3315ebcbde88dee6799ddd49

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]