. ./_util.ps1

$live_file = ''
$git_file = ''
$filetype = PromptForRequiredValue -prompt 'Which file to diff (a = autoexec.cfg, v = videoconfig.txt) [A/v]' -default 'a'

if($filetype.ToLower() -eq 'a') {
    $live_file = $AUTOEXEC_LIVE
    $git_file = $AUTOEXEC_GIT
} elseif($filetype.ToLower() -eq 'v') {
    $live_file = $VIDEOCONFIG_LIVE
    $git_file = $VIDEOCONFIG_GIT
} else {
    Write-Error "Unknown filetype - exiting"
    exit
}

git diff --no-patch --exit-code "${git_file}" "${live_file}"
$no_changes = $?

if($no_changes) {
    Write-Output "${git_file} has no changes"
    exit
}

if(Get-Command 'code' -ErrorAction SilentlyContinue) {
    code --diff "${live_file}" "${git_file}"
} else {
    git diff "${live_file}" "${git_file}"
}
