# eks-on-fargate

k8s manifests for EKS on Fargate.

## Components

- Ingress Controller
  - traefik
- Logging
  - fluent-bit
  - fluentd
  - loki
  - grafana
- Monitoring
  - prometheus
  - node-exporter
  - grafana

## Require

kustomize v3.6.1

## Usage

Check your YAML.

```shell
kustomize build overlays/example > example.yml
```

Apply.

```shell
kustomize build overlays/example | kubectl apply -f -
./scripts/grafana-dashboards.sh
```
