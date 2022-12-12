#!/bin/bash

. ./_util.sh

pull() {
    local livefile=$1
    local gitfile=$2

    git diff --no-patch --exit-code "${gitfile}"
    gitfile_has_changes=$?

    if [ $gitfile_has_changes == 0 ]; then
        cp "${livefile}" "${gitfile}"
        chmod u+w "${gitfile}"
    else
        echo "${gitfile} has local changes - please commit or revert first"
    fi
}

pull "${AUTOEXEC_LIVE}" "${AUTOEXEC_GIT}"
pull "${VIDEOCONFIG_LIVE}" "${VIDEOCONFIG_GIT}"
