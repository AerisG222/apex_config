$AUTOEXEC_GIT='autoexec.cfg'
$AUTOEXEC_LIVE="C:\Program Files (x86)\Steam\steamapps\common\Apex Legends\cfg\autoexec.cfg"
$VIDEOCONFIG_GIT='videoconfig.txt'
$VIDEOCONFIG_LIVE="$($env:USERPROFILE)/Saved Games/Respawn/Apex/local/videoconfig.txt"

function PromptForRequiredValue (
    [Parameter(Mandatory = $true)] [string] $prompt,
    [string] $default
) {
    $val = ''

    while([string]::IsNullOrWhiteSpace($val)) {
        $val = Read-Host $prompt

        if(-Not $val) {
            $val = $default
        }
    }

    return $val
}
