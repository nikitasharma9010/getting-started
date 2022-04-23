# Kubectl commands

```sh
# Get help
kubeclt --help

# Get kubectl version
kubectl version --client -o yaml

# List kubectl contexts
kubectl config get-contexts

# Get kubectl current context
kubectl config current-context

# Change to a particular context
kubectl config use-context REPLACE_WITH_CONTEXT_NAME

# Delete a kubectl context
kubectl config delete-context REPLACE_WITH_CONTEXT_NAME

# List resource
# kubectl get ...

# List namespaces (ns is shorthand for namespaces, can use either)
kubectl get ns

# List pods in default namespace (po is shorthand for pods, can use either)
kubectl get po

# List pods across all namespaces
kubectl get po -A

# List pods in default namespace with more information
kubectl get po -o wide

# List nodes (no is shorthand for nodes, can use either)
kubectl get no

# List deployments (deploy is shorthand for deployments, can use either)
kubectl get deploy

# List services (svc is shorthand for services, can use either)
kubectl get svc

# Describe resource
# kubectl describe ...

# Describe a pod
kubectl describe REPLACE_WITH_POD_NAME

# Create a deployment
kubectl create deploy REPLACE_WITH_DEPLOYMENT_NAME --image=REPLACE_WITH_IMAGE_NAME

# Get pod logs
kubectl logs REPLACE_WITH_POD_NAME

# Create a resource using yaml
# kubectl create -f ...

# Create a deployment using deployment yaml
kubectl create -f REPLACE_WITH_DEPLOYMENT_YAML

# Apply configuration to deployment
kubectl apply -f REPLACE_WITH_CONFIGURATION_YAML

# Expose deployment on a particular port
kubectl expose deploy REPLACE_WITH_DEPLOYMENT_NAME --type=NodePort --port=REPLACE_WITH_PORT_NUMBER
```
