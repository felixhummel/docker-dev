Development image with Felix' collection of dev tools.

Useful for debugging docker networks and pods or simply hacking on some scripts.


# Usage

## Locally
```
docker run -it --rm felix/dev:v1.1.0
```

## Kubernetes
```
mkdir -p kube
wget https://raw.githubusercontent.com/felixhummel/docker-dev/v1.1.0/kube/dev/yml \
  -O kube/dev.yml

kubectl apply -f kube/dev.yml
kubectl get deploy dev --watch
kubectl exec -it deployment/dev bash
```


# Development
```
make
```
