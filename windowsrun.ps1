$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = ".\html"  # Replace with the directory you want to monitor
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true

$action = {
    # Replace this command with the one you want to run when changes are detected
    Write-Host "Changes detected! Running command..."
    # Example command: run a batch file
    $output = Invoke-Expression -Command "windows\wkhtmltopdf --enable-local-file-access --page-size letter --margin-top 0 --margin-bottom 0 --margin-left 0 --margin-right 0 html\index.html out.pdf" 2>&1
    Write-Host $output
}

$action.Invoke()

$onChange = Register-ObjectEvent $watcher "Changed" -Action $action
$onCreate = Register-ObjectEvent $watcher "Created" -Action $action
$onDelete = Register-ObjectEvent $watcher "Deleted" -Action $action
$onRename = Register-ObjectEvent $watcher "Renamed" -Action $action

Write-Host "Listening for changes in directory: $($watcher.Path)"
Write-Host "Press Ctrl+C to stop."

try {
    while ($true) {
        # Keep the script running
        Start-Sleep -Seconds 1
    }
} finally {
    # Clean up the event subscriptions when the script is stopped
    Unregister-Event -SourceIdentifier $onChange.Name
    Unregister-Event -SourceIdentifier $onCreate.Name
    Unregister-Event -SourceIdentifier $onDelete.Name
    Unregister-Event -SourceIdentifier $onRename.Name
}
