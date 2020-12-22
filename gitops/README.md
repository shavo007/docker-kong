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

With `api_key`

```bash
curl -i -X GET \
  'http://localhost:8000/greetings' \
  -H 'api_key: zqnnuwpZ4tL0fJFgLIoSzCnidTr3IY3S'
```

curl --request GET \
  --url http://localhost:8081/greetings \
  --header 'api_key: apiKey'
## Resources

[Kong gitops](https://docs.konghq.com/deck/guides/ci-driven-configuration/)
