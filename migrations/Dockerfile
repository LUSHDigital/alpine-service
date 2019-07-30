FROM alpine:latest
RUN apk update && \
    apk --no-cache add ca-certificates

ENV MIGRATIONS_URL=file://migrations

ONBUILD WORKDIR /
ONBUILD COPY --from=0 /repo/build app
ONBUILD COPY service/database/migrations migrations

CMD ["app/service"]
