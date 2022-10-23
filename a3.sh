kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml


# add a flag 
# --kubelet-insecure-tls 
# to deployment.spec.containers[].args[] using the command 
kubectl -nkube-system edit deploy/metrics-server

kubectl -nkube-system rollout restart deploy/metrics-server

#HPA
kubectl apply -f ./demo/a3/autoscaler.yaml
kubectl describe hpa

#zone aware node app
kubectl apply -f ./demo/a3/node-manifest.yaml
kubectl get po -lapp=web -owide --sort-by='.spec.nodeName'