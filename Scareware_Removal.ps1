# Clear browsing history
$shell = New-Object -ComObject Shell.Application
$shell.NameSpace(34).Items() | foreach {
    $shell.Namespace(34).InvokeVerb("Delete")
}
function Clear-ChromeBrowsingHistory {
    $profilesPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\"
    $profiles = Get-ChildItem -Path $profilesPath -Directory -Filter "Profile *"

    foreach ($profile in $profiles) {
        $historyPath = Join-Path -Path $profile.FullName -ChildPath "Default\History"
        if (Test-Path -Path $historyPath) {
            Remove-Item -Path $historyPath -Force
        }
    }
}

Clear-ChromeBrowsingHistory
