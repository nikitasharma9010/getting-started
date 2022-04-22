source ../utils/common.sh
source ../brew/setup.sh

INSTALL="false"

add_configuration_workspace() {
    cat <<- 'EOF' >> "${CONFIGURATION_FILE}"

# GO - WORKSPACE ENV
# (comment these lines when installing "goenv",
# as they can cause abnormal behaviour when using "genv")
EOF

    cat <<- EOF >> "${CONFIGURATION_FILE}"
export GOPATH="${GO_WORKSPACE_PATH}"
EOF

    cat <<- 'EOF' >> "${CONFIGURATION_FILE}"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="${PATH}:${GOPATH}/bin"
export PATH="${PATH}:${GOROOT}/bin"
EOF
}

create_workspace() {
    printf "Create workspace (y/n)? "
    read response
    if [[ "$(echo "${response}" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        printf "Enter path to your go workspace: "
        read GO_WORKSPACE_PATH
        add_configuration_workspace
        mkdir -p "${GOPATH}/src" "${GOPATH}/pkg" "${GOPATH}/bin"
    fi
}

install_go() {
    if [[ -z "$(command -v go)" ]]; then
        INSTALL="true"
        install_brew
        brew update
        brew install go
        get_configuration_file
        create_workspace
    fi
}

main() {
    if [[ "$(pwd)" == *"go" ]]; then
        install_go
        if [[ "${INSTALL}" == "false" ]]; then
            echo "go already exists."
        fi
        go version
    fi
}

main