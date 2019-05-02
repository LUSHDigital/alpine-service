FROM alpine:latest
ENV MIGRATIONS_URL=file://migrations

ONBUILD WORKDIR /
ONBUILD COPY --from=0 /repo/build build
ONBUILD COPY service/database/migrations migrations

CMD ["build/service"]
