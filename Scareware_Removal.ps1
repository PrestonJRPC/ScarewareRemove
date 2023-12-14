# Clear Chrome cache
$chromeCachePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache"
Remove-Item -Path $chromeCachePath -Recurse -Force

# Clear Chrome browsing history
$chromeHistoryPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History"
Remove-Item -Path $chromeHistoryPath -Force

# Turn off Chrome notifications
$chromePreferencesPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Preferences"
$chromePreferences = Get-Content -Path $chromePreferencesPath | ConvertFrom-Json
$chromePreferences.profile.default_content_setting_values.notifications = 2
$chromePreferences | ConvertTo-Json | Set-Content -Path $chromePreferencesPath

# Turn off Chrome notifications in the registry
$chromeRegistryPath = "HKCU:\Software\Policies\Google\Chrome"
$chromeRegistryValueName = "DefaultNotificationsSetting"
$chromeRegistryValueData = 2

if (!(Test-Path $chromeRegistryPath)) {
    New-Item -Path $chromeRegistryPath -Force | Out-Null
}

Set-ItemProperty -Path $chromeRegistryPath -Name $chromeRegistryValueName -Value $chromeRegistryValueData
