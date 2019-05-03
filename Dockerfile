FROM alpine:latest
RUN apk update && \
    apk add ca-certificates && \
    rm -rf /var/cache/apk/*

ENV MIGRATIONS_URL=file://migrations

ONBUILD WORKDIR /
ONBUILD COPY --from=0 /repo/build app
ONBUILD COPY service/database/migrations migrations

CMD ["app/service"]
