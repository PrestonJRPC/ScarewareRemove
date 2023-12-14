function Get-ChromeHistory {
    $historyFile = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\History"
    
    if (Test-Path $historyFile) {
        $connectionString = "Data Source=$historyFile;Version=3;New=False;Compress=True;"
        $connection = New-Object System.Data.SQLite.SQLiteConnection($connectionString)
        $connection.Open()

        $query = "SELECT url, title, last_visit_time FROM urls ORDER BY last_visit_time DESC"
        $command = New-Object System.Data.SQLite.SQLiteCommand($query, $connection)
        $reader = $command.ExecuteReader()

        while ($reader.Read()) {
            $url = $reader.GetValue(0)
            $title = $reader.GetValue(1)
            $lastVisitTime = [DateTime]::FromFileTimeUtc($reader.GetInt64(2))

            Write-Output "URL: $url"
            Write-Output "Title: $title"
            Write-Output "Last Visit Time: $lastVisitTime"
            Write-Output ""
        }

        $reader.Close()
        $connection.Close()
    }
    else {
        Write-Output "Chrome history file not found."
    }
}
