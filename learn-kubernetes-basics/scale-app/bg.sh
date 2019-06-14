minikube start
kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 --port=8080
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
echo "done" >> /root/katacoda-finished
