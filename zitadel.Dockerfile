FROM ghcr.io/zitadel/zitadel:v2.64.1@sha256:5dba3692aa50f55d5d36979b63ddb389ceef54ed39f6fedd91251b7fd1649d5e

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]