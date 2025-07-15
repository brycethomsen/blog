FROM caddy:latest AS builder

FROM scratch
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY output/ /www
EXPOSE 80
CMD ["/usr/bin/caddy", "file-server", "--root", "/www"]