#!/bin/bash

set -eu

docker buildx install

TAG="$ARTIFACT_REGISTRY"/"${GITHUB_REPOSITORY#*/}":"$GITHUB_SHA"
docker build . --target runtime -t "$TAG"
docker build . --target testrunner -t "$TAG"-testrunner

docker push "$TAG"
docker push "$TAG"-testrunner
