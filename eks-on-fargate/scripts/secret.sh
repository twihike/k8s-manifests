#!/bin/sh

SELF_DIR=$( (cd $(dirname $0); pwd) )

main() {
  kubectl -n tk-system create secret generic \
    aws-secret \
    --from-env-file="${SELF_DIR}/aws-secret.env" \
    -o yaml --dry-run \
  | kubectl apply -f -
}
