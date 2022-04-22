source ../brew/setup.sh

INSTALL="false"

install_yq() {
    if [[ -z "$(command -v yq)" ]]; then
        INSTALL="true"
        install_brew
        brew install yq
    fi
}

main() {
    if [[ "$(pwd)" == *"yq" ]]; then
        install_yq
        if [[ "${INSTALL}" == "false" ]]; then
            echo "yq already exists."
        fi
        yq --version
    fi
}

main