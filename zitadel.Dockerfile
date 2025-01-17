FROM ghcr.io/zitadel/zitadel:v2.67.3@sha256:c364c60d106ed49c39ac00ebdacece546ecff881ba62c56779de4f787032049e

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]