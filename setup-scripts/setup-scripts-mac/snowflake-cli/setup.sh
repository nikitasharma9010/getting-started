source ../brew/setup.sh

INSTALL="false"

alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql

add_configuration() {
    cat <<- 'EOF' >> "${CONFIGURATION_FILE}"

# SNOWFLAKE
alias snowsql=/Applications/SnowSQL.app/Contents/MacOS/snowsql
EOF
}

install_snowsql() {
    if [[ -z "$(command -v snowsql)" ]]; then
        INSTALL="true"
        install_brew
        brew install --cask snowflake-snowsql
        add_configuration
    fi
}

main() {
    if [[ "$(pwd)" == *"snowflake-cli" ]]; then
        install_snowsql
        if [[ "${INSTALL}" == "false" ]]; then
            echo "snowflake cli already exists."
        fi
        snowsql --version
    fi
}

main