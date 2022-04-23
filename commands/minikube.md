# Minikube commands

```sh
# Get help
minikube --help

# Get minikube version
minikube version

# List global options, that can be used with any minikube command
minikube options

# Create a local kubernetes cluster
minikube start

# Create another local cluster with given name
minikube start -p REPLACE_WITH_CLUSTER_NAME 

# Upgrade cluster
minikube start --kubernetes-version=latest

# Check status of local kubernetes cluster
minikube status

# Check status of a particular cluster
minikube status -p REPLACE_WITH_CLUSTER_NAME

# Access kubernetes dashboard
minikube dashboard

# Get minikube logs (used to debug minikube)
minikube logs

# List minikube clusters
minikube profile list

# Access service from web browser
minikube service REPLACE_WITH_SERVICE_NAME

# Stop cluster
minikube stop

# Stop a particular cluster
minikube stop -p REPLACE_WITH_CLUSTER_NAME

# Delete cluster
minikube delete

# Delete a particular cluster
minikube delete -p REPLACE_WITH_CLUSTER_NAME

# Delete all minikube clusters
minikube delete --all

# If kubectl is not installed locally, we can use minikube kubectl as
minikube kubectl -- <kubectl commands>
# Ex: minikube kubectl -- --help
# minikube kubectl -- get po -A
# minikube kubectl -- get ns
```
