# Get the Chrome profiles directory
$chromeProfilesDir = "$env:LOCALAPPDATA\Google\Chrome\User Data"

# List all the profiles
$profiles = Get-ChildItem -Path $chromeProfilesDir -Directory | Select-Object -ExpandProperty Name

# Loop through each profile and delete the cache
foreach ($profile in $profiles) {
    $cacheDir = Join-Path -Path $chromeProfilesDir -ChildPath "$profile\Cache"
    if (Test-Path -Path $cacheDir) {
        Remove-Item -Path $cacheDir -Recurse -Force
        Write-Host "Cache deleted for profile: $profile"
    }
}
