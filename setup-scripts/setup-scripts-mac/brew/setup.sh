INSTALL="false"

install_brew() {
    if [[ -z "$(command -v brew)" ]]; then
        INSTALL="true"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

main() {
    if [[ "$(pwd)" == *"brew" ]]; then
        install_brew
        if [[ "${INSTALL}" == "false" ]]; then
            echo "brew already exists."
        fi
        brew --version
    fi
}

main