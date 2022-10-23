# assume image has been built

kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml
docker ps
kubectl cluster-info 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kind load docker-image otota1-node --name kind-1
kubectl apply -f ./demo/a2/node-manifest.yaml
# wait for deployment to be available
kubectl wait deployment -n default web --for condition=Available=True --timeout=90s
kubectl get deployment/web


kubectl apply -f ./demo/a2/service-manifest.yaml
kubectl get svc

# wait for ingress to be available
kubectl -n ingress-nginx get deploy
kubectl apply -f ./demo/a2/networking-manifest.yaml
kubectl get ingress

# rerun script if it fails to complete, it will not change things which are already set
# usually would be ingress not available before applying networking-manifest
