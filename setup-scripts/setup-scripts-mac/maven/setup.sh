source ../brew/setup.sh

INSTALL="false"

install_maven() {
    if [[ -z "$(command -v mvn)" ]]; then
        INSTALL="true"
        install_brew
        brew install maven
    fi
}

main() {
    if [[ "$(pwd)" == *"maven" ]]; then
        install_maven
        if [[ "${INSTALL}" == "false" ]]; then
            echo "maven already exists."
        fi
        mvm --version
    fi
}

main