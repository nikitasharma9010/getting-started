source ../brew/setup.sh

INSTALL="false"

install_kind() {
    if [[ -z "$(command -v kind)" ]]; then
        INSTALL="true"
        install_brew
        brew install kind
    fi
}

main() {
    if [[ "$(pwd)" == *"kind" ]]; then
        install_kind
        if [[ "${INSTALL}" == "false" ]]; then
            echo "kind already exists."
        fi
        kind --version
    fi
}

main