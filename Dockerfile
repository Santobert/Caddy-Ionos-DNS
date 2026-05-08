FROM caddy:2.11.2-builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/ionos@v1.2.0 \
  --with github.com/hslatman/caddy-crowdsec-bouncer/http@v0.10.0 \
  --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@v0.10.0 \
  --with github.com/hslatman/caddy-crowdsec-bouncer/appsec@v0.10.0

FROM caddy:2.11.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
