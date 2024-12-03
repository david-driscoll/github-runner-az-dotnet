FROM ghcr.io/zitadel/zitadel:v2.65.2@sha256:fc46399e015e91cb3017f60ce527559c76f70a96041cece6da3d28b9be70d406

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]