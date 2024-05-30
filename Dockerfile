FROM caddy:2.8.0-builder AS builder

RUN xcaddy build --with github.com/caddy-dns/ionos

FROM caddy:2.8.0-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
