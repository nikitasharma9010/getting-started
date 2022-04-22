source ../utils/common.sh

INSTALL="false"

add_configuration() {
    cat <<- 'EOF' >> "${CONFIGURATION_FILE}"

# JENV
export JENV_ROOT="$HOME/.jenv"
export PATH="$JENV_ROOT/bin:$PATH"
eval "(jenv init -)"
EOF
}

install_jenv() {
    if [[ (-z "$(command -v jenv)") | (-z "$(command -v go)") ]]; then
        INSTALL="true"
        git clone https://github.com/jenv/jenv.git ~/.jenv
        get_configuration_file
        add_configuration
    fi
}

upgrade_jenv() {
    printf "Upgrade jenv (y/n)? "
    read response
    if [[ "$(echo "${response}" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        cd $(jenv root)
        git pull
    fi
}

main() {
    if [[ "$(pwd)" == *"jenv" ]]; then
        install_jenv
        if [[ "${INSTALL}" == "false" ]]; then
            echo "jenv already exists."
            upgrade_jenv
        fi
        jenv --version
    fi
}

main