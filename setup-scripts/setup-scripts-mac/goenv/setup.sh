source ../utils/common.sh

INSTALL="false"

add_configuration() {
    cat <<- 'EOF' >> "${CONFIGURATION_FILE}"

# GOENV
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
EOF
}

install_goenv() {
    if [[ (-z "$(command -v goenv)") | (-z "$(command -v go)") ]]; then
        INSTALL="true"
        git clone https://github.com/syndbg/goenv.git ~/.goenv
        get_configuration_file
        add_configuration
    fi
}

upgrade_goenv() {
    printf "Upgrade goenv (y/n)? "
    read response
    if [[ "$(echo "${response}" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        cd $(goenv root)
        git pull
    fi
}

main() {
    if [[ "$(pwd)" == *"goenv" ]]; then
        install_goenv
        if [[ "${INSTALL}" == "false" ]]; then
            echo "goenv already exists."
            upgrade_goenv
        fi
        goenv --version
    fi
}

main