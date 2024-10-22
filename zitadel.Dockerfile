FROM ghcr.io/zitadel/zitadel:v2.64.0@sha256:1a5a35f79f421be26b2e4f1ca75c0d84344be65ac83f9becb3d66d53dac56b51

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]