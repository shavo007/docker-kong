#!/usr/bin/env sh
set -o pipefail 

echo "Generate Kong declarative configuration from Spec"
inso generate config ../oas.yaml --type declarative > ./kong.yaml
echo "Validate Kong declarative configuration"
deck validate
echo "Deploy declarative config"
deck sync

