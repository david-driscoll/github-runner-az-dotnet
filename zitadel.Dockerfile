FROM ghcr.io/zitadel/zitadel:v4.12.2@sha256:f65429aff8d0042d68c14007c69ae91914d4d73b368db48e54d4d77732efb272

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]