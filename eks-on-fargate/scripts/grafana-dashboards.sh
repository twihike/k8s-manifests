#!/bin/sh

SELF_DIR=$( (cd $(dirname $0); pwd) )

main() {
  if [ $# -ne 2 ]; then
    usage
    return
  fi
  apply "$@"
}

usage() {
  cat <<EOF
Usage: $0 <env_name> <namespace>
EOF
}

apply() {
  ENV_NAME="$1"
  NAMESPACE="$2"
  if [ "${ENV_NAME}" = "base" ]; then
    DASHBOARDS_DIR="${SELF_DIR}/../${ENV_NAME}/dashboards/"
  else
    DASHBOARDS_DIR="${SELF_DIR}/../overlays/${ENV_NAME}/grafana-dashboards/"
  fi

  if kubectl -n "${NAMESPACE}" get cm grafana-dashboards > /dev/null; then
    kubectl -n "${NAMESPACE}" delete configmap grafana-dashboards
  fi

  kubectl -n "${NAMESPACE}" create configmap grafana-dashboards \
    --from-file="${DASHBOARDS_DIR}"
}
