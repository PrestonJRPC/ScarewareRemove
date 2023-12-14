$chromeProfilePath = "$env:LOCALAPPDATA\Google\Chrome\User Data"
$profileFolders = Get-ChildItem -Path $chromeProfilePath -Directory

$profileNames = $profileFolders | ForEach-Object {
    $_.Name
}

$profileNames
