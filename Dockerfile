FROM alpine:latest
RUN apk update && \
    apk --no-cache add ca-certificates

ONBUILD WORKDIR /
ONBUILD COPY --from=0 /repo/build app

CMD ["app/service"]
