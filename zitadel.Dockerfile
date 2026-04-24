FROM ghcr.io/zitadel/zitadel:v4.14.0@sha256:d961cfaab2f15272b4aa3bebf430f2f9490ec5a22fc82bbe8de781054bffcfb3

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD true
ENTRYPOINT ["/app/zitadel", "start-from-init", "--masterkey", "MasterkeyNeedsToHave32Characters", "--tlsMode", "external"]