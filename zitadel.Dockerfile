FROM ghcr.io/zitadel/zitadel:v4.2.2@sha256:a068660b0b22b712fae327d5e70263c3b695cfa5db5234b75603bc512a8acdd0

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]