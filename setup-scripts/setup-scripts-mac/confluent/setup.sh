source ../utils/common.sh

INSTALL="false"

add_configuration() {
    echo $'\n'"# CONFLUENT PLATFORM" >> "${CONFIGURATION_FILE}"
    echo 'export PATH="${HOME}/confluent-'"${release}"'/bin:${PATH}"' >> "${CONFIGURATION_FILE}"
}

get_cp_all_in_one() {
    git clone "https://github.com/confluentinc/cp-all-in-one.git"
    git checkout "${release}-post"
}

install_confluent() {
    if [[ -z "$(command -v confluent)" ]]; then
        INSTALL="true"

        printf "Enter release of confluent platform (x.y.z): "
        read release
        IFS='.' read -r -a array <<< "${release}"
        version="${array[0]}.${array[1]}"
        package="confluent-${release}.zip"
        url="http://packages.confluent.io/archive/${version}/${package}"

        cd "${HOME}"
        curl -O "${url}"
        unzip "${package}"
        rm "${package}"
        get_configuration_file
        add_configuration
        get_cp_all_in_one
    fi
}

main() {
    if [[ "$(pwd)" == *"confluent" ]]; then
        install_confluent
        if [[ "${INSTALL}" == "false" ]]; then
            echo "confluent already exists."
        fi
        confluent --version
    fi
}

main