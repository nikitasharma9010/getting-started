source ../brew/setup.sh

INSTALL="false"

install_node() {
    if [[ -z "$(command -v node)" ]]; then
        INSTALL="true"
        install_brew
        brew install node
    fi
}

main() {
    if [[ "$(pwd)" == *"node" ]]; then
        install_node
        if [[ "${INSTALL}" == "false" ]]; then
            echo "node already exists."
        fi
        node --version
    fi
}

main