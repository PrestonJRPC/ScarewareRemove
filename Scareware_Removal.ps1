function DisableChromeNotifications {
    $chromeRegPath = "HKCU:\Software\Policies\Google\Chrome"
    $chromeRegValue = "NotificationsAllowedForUrls"

    if (-not (Test-Path $chromeRegPath)) {
        New-Item -Path $chromeRegPath -Force | Out-Null
    }

    Set-ItemProperty -Path $chromeRegPath -Name $chromeRegValue -Value 0
}

function VerifyRegistryChange {
    $chromeRegPath = "HKCU:\Software\Policies\Google\Chrome"
    $chromeRegValue = "NotificationsAllowedForUrls"

    $value = Get-ItemPropertyValue -Path $chromeRegPath -Name $chromeRegValue

    if ($value -eq 0) {
        Write-Host "Registry change successful. Value: $value"
    } else {
        Write-Host "Registry change failed. Value: $value"
    }
}

DisableChromeNotifications
VerifyRegistryChange
