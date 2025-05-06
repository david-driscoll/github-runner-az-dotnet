FROM ghcr.io/zitadel/zitadel:v3.0.1@sha256:f0b9df36cbdf05e985d093fed7b8f2a100b4d8828659b7320ff66208811fd2b0

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]