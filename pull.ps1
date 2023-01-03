. ./_util.ps1

function Pull (
    [Parameter(Mandatory = $true)] [string] $liveFile,
    [Parameter(Mandatory = $true)] [string] $gitFile
) {
    git diff --no-patch --exit-code "${gitFile}"
    $no_changes = $?

    if($no_changes) {
        attrib -R "${gitFile}"
        Copy-Item "${livefile}" "${gitFile}"
        attrib -R "${gitFile}"
    } else {
        Write-Output "${gitFile} has local changes - please commit or revert first"
    }
}

Pull -liveFile "${AUTOEXEC_LIVE}" -gitFile "${AUTOEXEC_GIT}"
Pull -liveFile "${VIDEOCONFIG_LIVE}" -gitFile "${VIDEOCONFIG_GIT}"
