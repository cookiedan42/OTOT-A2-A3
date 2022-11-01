# change autoscaler to 1% so we can force scale up to 10 easily
kubectl apply -f ./demo/a3/autoscaler_1_percent.yaml 
kubectl get nodes -L topology.kubernetes.io/zone
kubectl get po -lapp=web -owide --sort-by='.spec.nodeName'