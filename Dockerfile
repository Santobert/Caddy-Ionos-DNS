FROM caddy:2.11.4-builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/ionos@v1.2.0 \
  --with github.com/hslatman/caddy-crowdsec-bouncer/http@v0.13.1 \
  --with github.com/hslatman/caddy-crowdsec-bouncer/layer4@v0.13.1 \
  --with github.com/hslatman/caddy-crowdsec-bouncer/appsec@v0.13.1

FROM caddy:2.11.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
