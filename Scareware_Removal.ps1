function DisableChromeNotifications {
    $chromeRegPath = "HKCU:\Software\Policies\Google\Chrome"
    $chromeRegValue = "NotificationsAllowedForUrls"

    if (-not (Test-Path $chromeRegPath)) {
        New-Item -Path $chromeRegPath -Force | Out-Null
    }

    Set-ItemProperty -Path $chromeRegPath -Name $chromeRegValue -Value 0
}

DisableChromeNotifications
