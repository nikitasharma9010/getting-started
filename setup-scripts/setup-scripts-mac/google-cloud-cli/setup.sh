INSTALL="false"

install_gcloud_cli() {
    if [[ -z "$(command -v gcloud)" ]]; then
        INSTALL="true"
        curl https://sdk.cloud.google.com | bash
    fi
}

main() {
    if [[ "$(pwd)" == "google-cloud-cli" ]]; then
        install_gcloud_cli
        if [[ "${INSTALL}" == "false" ]]; then
            echo "gcloud cli already exists."
        fi
        gcloud --version
    fi
}

main