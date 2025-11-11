FROM ghcr.io/zitadel/zitadel:v4.6.5@sha256:17fe8217d10dcc58e08c9c22a1b2c9d226d105e535136f7dd60427e7410dbcee

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]