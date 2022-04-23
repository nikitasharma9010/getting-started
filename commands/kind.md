# Kind commands

```sh
# Get help
kind --help

# Get kind version
kind --version

# Get kind cli version
kind version

# Create local kubernetes cluster
kind create cluster

# Create local kubernetes cluster with a given name
kind create cluster --name REPLACE_WITH_CLUSTER_NAME

# Create a cluster using configuration file
kind create cluster --config REPLACE_WITH_CONFIGURATION_YAML

# Create a cluster using image
kind create cluster --image REPLACE_WITH_KIND_IMAGE 

# List kind clusters
kind get clusters

# Delete a kind cluster
kind delete cluster --name REPLACE_WITH_CLUSTER_NAME
```
