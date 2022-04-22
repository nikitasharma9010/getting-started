source ../brew/setup.sh

INSTALL="false"

install_kubectl() {
    if [[ -z "$(command -v kubectl)" ]]; then
        INSTALL="true"
        install_brew
        brew install kubectl
    fi
}

main() {
    if [[ "$(pwd)" == *"kubectl" ]]; then
        install_kubectl
        if [[ "${INSTALL}" == "false" ]]; then
            echo "kubectl already exists."
        fi
        kubectl version
    fi
}

main