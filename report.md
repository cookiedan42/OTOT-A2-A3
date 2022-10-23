// how to run A2

1) build image for node app
cd to app folder
`docker build . -t otot-a1-node`
load the image

2) startup cluster
cd to root
```
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml


load image
kind load docker-image otota1-node --name kind-1

create ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml


create service
kubectl apply -f ./demo/a2/service-manifest.yaml

create node
kubectl apply -f ./demo/a2/node-manifest.yaml


kubectl apply -f ./demo/a2/networking-manifest.yaml
```


// how to run a3
```
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

add a flag --kubelet-insecure-tls 
to deployment.spec.containers[].args[] 
using the command kubectl -nkube-system edit deploy/metrics-server 

//restart
kubectl -nkube-system rollout restart deploy/metrics-server

kubectl apply -f ./demo/a3/autoscaler.yaml 


```


//check running services
kubectl get svc 

kubectl get po --watch


3. After cloning the A2-A3 repository, complete the following tasks:


a. Task A2.1: deploy a local k8s cluster
    i. Follow the steps and create your own cluster
    ii. In the report (see Instructions point 4), describe the commands you need to create and verify the cluster
        > following readme
        > `kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml`
        > `kubectl cluster-info` --> verify that control plane is running on 127.0.0.1


    iii. This task is a prerequisite to the rest of Task A2 and A3
b. Task A2.2: deploy your A1 Docker image to Kubernetes as a Deployment with 3 replicas exposed by a Service object
    i. Add the relevant Deployment manifest (e.g. backend-deployment.yaml) in the k8s/manifests/k8s folder in your repo
        1. Please deploy a different image from the nginx image used as an example in the guide
    ii. Add the relevant Service manifest (e.g. backend-service.yaml) in the k8s/manifests/k8s folder in your repo
    iii. In the report, describe the commands you used to
        1. Create the Deployment in the cluster and verify that the Pods/containers are running, and
        2. Create the Service and verify that it works as expected
c. Task A2.3: deploy an ingress controller and an Ingress that allows you to connect to the Deployment/Service from your browser
    i. Add the relevant Ingress manifest (e.g. backend-ingress.yaml) in the k8s/manifests/k8s folder in your repo
        1. The nginx-ingress-controller is different from the nginx image used in the guide. You can continue to use nginx-ingress-controller.
    ii. In the report, describe the commands and steps you used to
        1. Create the ingress-controller and verify it works, and
        2. Create the Ingress and verify that it works