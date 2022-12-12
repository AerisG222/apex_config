#!/bin/bash

. ./_util.sh

live_file=
git_file=
filetype=$(get_value 'Which file to diff (a = autoexec.cfg, v = videoconfig.txt): [A/v]: ' 'a')

if [ ${filetype,,} = "a" ]; then
    live_file="${AUTOEXEC_LIVE}"
    git_file="${AUTOEXEC_GIT}"
elif [ ${filetype,,} = "v" ]; then
    live_file="${VIDEOCONFIG_LIVE}"
    git_file="${VIDEOCONFIG_GIT}"
else
    echo "Unknown filetype - exiting"
    exit
fi

git diff --no-patch --exit-code "${git_file}" "${live_file}"
has_changes=$?

if [ $has_changes == 0 ]; then
    echo "${git_file} has no changes"
    exit
fi

command -v code > /dev/null
vscode_check=$?

if [ ${vscode_check} == 0 ]; then
    code --diff "${live_file}" "${git_file}"
else
    git diff "${live_file}" "${git_file}"
fi
