#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname "${BASH_SOURCE[0]}")/../..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd "${SCRIPT_ROOT}"; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ../code-generator)}
bash "${CODEGEN_PKG}"/generate-groups.sh "deepcopy,client,informer,lister" \
  github.com/cloud-native-taiwan/controller101/pkg/generated \
  github.com/cloud-native-taiwan/controller101/pkg/apis \
  "cloudnative:v1alpha1" \
  --output-base "$(dirname ${BASH_SOURCE})/../../../../../" \
  --go-header-file ${SCRIPT_ROOT}/hack/k8s/boilerplate.go.txt