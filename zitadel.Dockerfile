FROM ghcr.io/zitadel/zitadel:v4.8.1@sha256:5c6d05bc2faf11a30d215da7686b705cd1caa9c3123b65012d6238f10b4906c0

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]