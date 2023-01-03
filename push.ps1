. ./_util.ps1

function Push (
    [Parameter(Mandatory = $true)] [string] $liveFile,
    [Parameter(Mandatory = $true)] [string] $gitFile,
    [Parameter(Mandatory = $true)] [string] $now
) {
    git diff --no-patch --exit-code "${gitFile}" "${liveFile}"
    $no_changes = $?

    if($no_changes) {
        Write-Output "${gitFile} has no changes - skipping"
    } else {
        $backupFile="${liveFile}.${now}"

        Copy-Item "${livefile}" "${backupFile}"

        if($gitFile -eq $VIDEOCONFIG_GIT) {
            attrib -R "${liveFile}"
        }

        Copy-Item "${gitFile}" "${livefile}"

        if($gitFile -eq $VIDEOCONFIG_GIT) {
            attrib +R "${liveFile}"
        }
    }
}

$now = get-date -format 'yyyyMMdd_HHmmss'

Push -liveFile "${AUTOEXEC_LIVE}" -gitFile "${AUTOEXEC_GIT}" -now "${now}"
Push -liveFile "${VIDEOCONFIG_LIVE}" -gitFile "${VIDEOCONFIG_GIT}"  -now "${now}"
