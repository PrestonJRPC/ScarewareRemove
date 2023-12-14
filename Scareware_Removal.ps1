$chromeProfilesPath = "$env:LOCALAPPDATA\Google\Chrome\User Data"

# Get all Chrome profile directories
$profileDirectories = Get-ChildItem -Path $chromeProfilesPath -Directory -Filter "Profile*"

foreach ($profileDirectory in $profileDirectories) {
    $cachePath = Join-Path -Path $profileDirectory.FullName -ChildPath "Cache"
    
    if (Test-Path -Path $cachePath) {
        $cacheSize = (Get-ChildItem -Path $cachePath -Recurse | Measure-Object -Property Length -Sum).Sum
        $cacheSizeInMB = $cacheSize / 1MB
        
        Write-Host "Profile $($profileDirectory.Name) - Cache Size: $($cacheSizeInMB)MB"
    }
}
