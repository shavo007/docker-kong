# Docker for kong

![Spectral lint workflow](https://github.com/shavo007/docker-kong/workflows/Run%20Spectral%20on%20Pull%20Requests/badge.svg)

## Getting started

```bash
cd compose
docker-compose up -d #start in detached mode
docker-compose ps #view status of the containers
docker run -d -p8081:8081 shanelee007/greetings-api:latest
```

Access konga at <http://localhost:9000/#!/dashboard>

## Gitops approach

Follow along [here](./gitops/README.md)

![Kong consumer](./gitops/kong_consumer.png)

## References
[konga setup](https://dev.to/vousmeevoyez/setup-kong-konga-part-2-dan)
