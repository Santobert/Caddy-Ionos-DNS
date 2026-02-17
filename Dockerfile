FROM caddy:2.10.2-builder AS builder

RUN xcaddy build \
  --with github.com/caddy-dns/ionos \
  --with github.com/hslatman/caddy-crowdsec-bouncer/http \
  --with github.com/hslatman/caddy-crowdsec-bouncer/layer4 \
  --with github.com/hslatman/caddy-crowdsec-bouncer/appsec

FROM caddy:2.10.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
