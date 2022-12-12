AUTOEXEC_GIT='autoexec.cfg'
AUTOEXEC_LIVE="${HOME}/.steam/steam/steamapps/common/Apex Legends/cfg/autoexec.cfg"
VIDEOCONFIG_GIT='videoconfig.txt'
VIDEOCONFIG_LIVE="${HOME}/.steam/steam/steamapps/compatdata/1172470/pfx/drive_c/users/steamuser/Saved Games/Respawn/Apex/local/videoconfig.txt"

get_value() {
    local prompt=$1
    local default=$2
    local val=

    while [ "${val}" = "" ]
    do
        read -e -r -p "${prompt}" val

        if [ "${val}" = "" -a "${default}" != "" ]; then
            val="${default}"
        fi
    done

    echo "${val}"
}
