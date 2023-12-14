# Get the path to the Chrome user data directory
$chromeUserDataDir = "$env:LOCALAPPDATA\Google\Chrome\User Data"

# Check if the Chrome user data directory exists
if (Test-Path $chromeUserDataDir) {
    # Enumerate the subdirectories in the Chrome user data directory
    $profiles = Get-ChildItem -Path $chromeUserDataDir -Directory

    # Loop through each profile directory
    foreach ($profile in $profiles) {
        # Get the profile name from the directory name
        $profileName = $profile.Name

        # Do something with the profile name
        Write-Host "Found Chrome profile: $profileName"
    }
}
else {
    Write-Host "Chrome user data directory not found."
}
