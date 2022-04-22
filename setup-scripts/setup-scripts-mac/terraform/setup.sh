source ../brew/setup.sh

INSTALL="false"

install_terraform() {
    if [[ -z "$(command -v terraform)" ]]; then
        INSTALL="true"
        install_brew
        brew install terraform
    fi
}

main() {
    if [[ "$(pwd)" == *"terraform" ]]; then
        install_terraform
        if [[ "${INSTALL}" == "false" ]]; then
            echo "terraform already exists."
        fi
        terraform --version
    fi
}

main