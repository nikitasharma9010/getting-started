source ../utils/common.sh

INSTALL="false"

add_configuration() {
    cat <<- 'EOF' >> "${CONFIGURATION_FILE}"

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "(pyenv init --path)"
eval "(pyenv init -)"
EOF
}

install_pyenv() {
    if [[ (-z "$(command -v pyenv)") | (-z "$(command -v go)") ]]; then
        INSTALL="true"
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
        get_configuration_file
        add_configuration
        install_brew
        brew install openssl readline sqlite sqlite3 xz zlib
    fi
}

upgrade_pyenv() {
    printf "Upgrade pyenv (y/n)? "
    read response
    if [[ "$(echo "${response}" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        cd $(pyenv root)
        git pull
    fi
}

main() {
    if [[ "$(pwd)" == *"pyenv" ]]; then
        install_pyenv
        if [[ "${INSTALL}" == "false" ]]; then
            echo "pyenv already exists."
            upgrade_pyenv
        fi
        pyenv --version
    fi
}

main