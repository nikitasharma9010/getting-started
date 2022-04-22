source ../brew/setup.sh

INSTALL="false"

install_helm() {
    if [[ -z "$(command -v helm)" ]]; then
        INSTALL="true"
        install_brew
        brew install helm
    fi
}

main() {
    if [[ "$(pwd)" == *"helm" ]]; then
        install_helm
        if [[ "${INSTALL}" == "false" ]]; then
            echo "helm already exists."
        fi
        helm version
    fi
}

main