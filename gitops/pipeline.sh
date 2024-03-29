#!/usr/bin/env sh
set -euo pipefail 

echo "Validate the spec"
npx @stoplight/spectral lint ../oas.yaml --fail-severity=error
echo "Generate Kong declarative configuration from Spec"
inso generate config ../oas.yaml --type declarative > ./kong.yaml
echo "Validate Kong declarative configuration"
deck validate
echo "Deploy declarative config"
deck sync  --verbose 1
curl --request POST \
  --url http://localhost:8001/consumers \
  --header 'Content-Type: application/json' \
  --data '{
  "username": "shavo007",
  "tags": [
    "high-prority"
  ]
}'
