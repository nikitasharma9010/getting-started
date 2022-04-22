source ../brew/setup.sh
sudo

INSTALL="false"

install_git() {
    if [[ -z "$(command -v git)" ]]; then
        INSTALL="true"
        install_brew
        brew install git
    fi
}

configure_git_basic() {
    printf "Configure name (y/n)? "
    read response
    if [[ "$(echo "${response}" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        printf "Enter name: "
        read name
        git config --global user.name "${name}"
    fi

    printf "Configure email (y/n)? "
    if [[ "$(echo "${response}" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
        printf "Enter email: "
        read email
        git config --global user.email "${email}"
    fi
}

main() {
    if [[ "$(pwd)" == *"git" ]]; then
        install_git
        if [[ "${INSTALL}" == "false" ]]; then
            echo "git already exists."
        fi
        git --version

        printf "Configure git (y/n)? "
        if [[ "$(echo "${response}" | tr '[:upper:]' '[:lower:]')" == "y" ]]; then
            configure_git_basic
        fi
    fi
}