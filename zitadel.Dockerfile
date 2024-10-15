FROM ghcr.io/zitadel/zitadel:v2.63.4


HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=5 CMD [ "curl", "-f", "http://localhost:8080/debug/ready" ]
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]