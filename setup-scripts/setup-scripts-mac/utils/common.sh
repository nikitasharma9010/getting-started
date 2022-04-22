# Path to shell configuration files
readonly BASHRC="${HOME}/.bashrc"
readonly BASH_PROFILE="${HOME}/.bash_profile"
readonly ZSHRC="${HOME}/.zshrc"

#####################################################
# Get the path to the shell's configuration file
# Environment variables:
#   SHELL
# Globals:
#   ZSHRC, BASHRC, BASH_PROFILE
# Outcome:
#   Sets value of CONFIGURATION_FILE with path to
#   shell's configuration file
#####################################################
get_configuration_file() {
    if [[ "${SHELL}" == *"zsh" ]]; then
        if [[ -f "${ZSHRC}" ]]; then
            CONFIGURATION_FILE="${ZSHRC}"
        elif [[ -f "${BASHRC}" ]]; then
            CONFIGURATION_FILE="${BASHRC}"
        elif [[ -f "${BASH_PROFILE}" ]]; then
            CONFIGURATION_FILE="${BASH_PROFILE}"
        fi
    fi
}

get_configuration_file
echo "${CONFIGURATION_FILE}"