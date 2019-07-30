# Alpine (service)
This Docker image is used to run service artefacts from a [multistage docker build](https://docs.docker.com/develop/develop-images/multistage-build/).

## Setting up your project Dockerfile
The image expects your previous build stage to have produced a `build/service` executable artefact which will be run by default.

```Dockerfile
FROM lushdigital/alpine-golang:latest
FROM lushdigital/alpine-service:latest
```

## Projects with database migrations
Some projects require database migrations to be copied over to the docker artefact to be executed at runtime. To make this process easier, you can base your docker image on the the `migrations` tag.

```Dockerfile
FROM lushdigital/alpine-golang:latest
FROM lushdigital/alpine-service:migrations
```

The image build will attempt to copy any database migrations that exist in your repository from `service/database/migrations` and provide a `MIGRATIONS_URL` environment variable with the file path in the container.

If you want to override the default `MIGRATIONS_URL` you can set it in your project dockerfile.

```Dockerfile
ENV MIGRATIONS_URL="ftp://my.migration.service.com/migrations"
```
