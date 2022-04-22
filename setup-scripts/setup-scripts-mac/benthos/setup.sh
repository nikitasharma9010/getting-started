source ../brew/setup.sh

INSTALL="false"

install_benthos() {
    if [[ -z "$(command -v benthos)" ]]; then
        INSTALL="true"
        install_brew
        brew install benthos
    fi
}

main() {
    if [[ "$(pwd)" == *"benthos" ]]; then
        install_benthos
        if [[ "${INSTALL}" == "false" ]]; then
            echo "benthos already exists."
        fi
        benthos --version
    fi
}

main