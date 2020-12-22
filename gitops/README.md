# Gitops approach (spec driven development)

## Install

```bash
brew install nvm
nvm install v12.18.3
npm i -g insomnia-inso #inso
brew tap kong/deck
brew install deck
```

## Steps

Run kong via docker compose [here](./../compose/docker-compose.yml)

Access konga at http://localhost:9000/#!/dashboard

Run the pipeline cmd just like your CI would 

```bash
./pipeline.sh
```

Test calling the API without api key

```bash
curl -i -X GET   --url http://localhost:8000/greetings
```

Example response 
```bash
$ curl -i -X GET   --url http://localhost:8000/greetings
HTTP/1.1 401 Unauthorized
Date: Tue, 22 Dec 2020 06:19:04 GMT
Content-Type: application/json; charset=utf-8
Connection: keep-alive
WWW-Authenticate: Key realm="kong"
Content-Length: 45
X-Kong-Response-Latency: 114
Server: kong/2.2.1

{
  "message":"No API key found in request"
}
```

> Create a consumer with an api key creds zqnnuwpZ4tL0fJFgLIoSzCnidTr3IY3S

With `api_key`

```bash
curl -i -X GET \
  'http://localhost:8000/greetings' \
  -H 'api_key: zqnnuwpZ4tL0fJFgLIoSzCnidTr3IY3S'
```

> rate limit exceeded example

```bash
$ curl -i -X GET   'http://localhost:8000/greetings'   -H 'api_key: zqnnuwpZ4tL0fJFgLIoSzCnidTr3IY3S'
HTTP/1.1 429 Too Many Requests
Date: Tue, 22 Dec 2020 07:27:42 GMT
Content-Type: application/json; charset=utf-8
Connection: keep-alive
Retry-After: 18
Content-Length: 41
X-RateLimit-Remaining-Minute: 0
X-RateLimit-Limit-Minute: 3
RateLimit-Remaining: 0
RateLimit-Limit: 3
RateLimit-Reset: 18
X-Kong-Response-Latency: 5
Server: kong/2.2.1

{
  "message":"API rate limit exceeded"
}
```
## Resources

[Kong gitops](https://docs.konghq.com/deck/guides/ci-driven-configuration/)
