response="START"
root_dir="$(pwd)"

while [[ "${response}" != "exit" ]]; do
    printf "\nInstallation setup is available for:\n\n"

    for setup_dir in $(ls -d */) ; do
        if [[ -f "${setup_dir}/setup.sh" ]]; then
            echo "${setup_dir%/}"
        fi 
    done

    printf "\nEnter tool(s) (separated by space) to install (or, type 'exit' to abort): "
    read response
    echo ""

    if [[ "${response}" == "exit" ]]; then
        echo "Aborting."
        exit
    else
        IFS=' ' read -r -a tools <<< "${response}"
        for tool in "${tools[@]}"; do
            cd "${tool}"
            sh setup.sh
            cd "${root_dir}"
            echo ""
        done
        printf "Press 'enter' to continue install more tools (type 'exit' to abort): "
        read response
    fi

done