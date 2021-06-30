FROM alpine:latest
RUN apk update && \
    apk --no-cache add \
	ca-certificates \
	tzdata

ONBUILD WORKDIR /
ONBUILD COPY --from=0 /repo/build app
EXPOSE 80 8080
RUN addgroup -S lushapp && adduser -S lushapp -G lushapp
USER lushapp
CMD ["app/service"]
