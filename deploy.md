# Deploy and Building

## Building docker image

- `make clean dirhtml`
- `docker build . -t docker.deinstapel.de/coda/system-optimiser/so-docs:$version`
- `docker push docker.deinstapel.de/coda/system-optimiser/so-docs:$version`

## Deploying the Documentation

- Build the template manifests into real manifests
  - `docker run -i --rm -e VERSION=$version -e IS_LATEST=true hairyhenderson/gomplate < kube-manifests.yaml.tmpl > kube-manifests.yaml`
- Apply the manifests within kubectl
  - `kubectl apply -f kube-manifests.yaml`
