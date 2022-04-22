source ../brew/setup.sh

INSTALL="false"

install_jq() {
    if [[ -z "$(command -v jq)" ]]; then
        INSTALL="true"
        install_brew
        brew install jq
    fi
}

main() {
    if [[ "$(pwd)" == *"jq" ]]; then
        install_jq
        if [[ "${INSTALL}" == "false" ]]; then
            echo "jq already exists."
        fi
        jq --version
    fi
}

main