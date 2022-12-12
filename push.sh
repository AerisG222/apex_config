#!/bin/bash

. ./_util.sh

push() {
    local livefile=$1
    local gitfile=$2
    local now=$3

    git diff --no-patch --exit-code "${gitfile}" "${livefile}"
    livefile_has_changes=$?

    if [ $livefile_has_changes == 0 ]; then
        echo "${gitfile} has no changes - skipping"
    else
        backupfile="${livefile}.${now}"

        cp "${livefile}" "${backupfile}"

        if [ "${gitfile}" == "${VIDEOCONFIG_GIT}" ]; then
            chmod u+w "${livefile}"
        fi

        cp "${gitfile}" "${livefile}"

        if [ "${gitfile}" == "${VIDEOCONFIG_GIT}" ]; then
            chmod u-w "${livefile}"
        fi

        bf=$(basename "${backupfile}")
        echo "${gitfile} pushed.  Backup created with name ${bf}"
    fi
}

now=$(date +%Y%m%d_%H%M%S)

push "${AUTOEXEC_LIVE}" "${AUTOEXEC_GIT}" "${now}"
push "${VIDEOCONFIG_LIVE}" "${VIDEOCONFIG_GIT}" "${now}"
