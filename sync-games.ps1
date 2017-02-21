Add-Type -AssemblyName System.Windows.Forms

$settingsFile = 'sync-games-path.txt'

$path = Get-Content $settingsFile
 
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    Description = 'Pick the path you want the games synced to'
    RootFolder = 0x11
    ShowNewFolderButton = $True
    SelectedPath = $path
}
 
$result = $FolderBrowser.ShowDialog()

if ($result -eq [Windows.Forms.DialogResult]::Ok) {
    $newpath = $FolderBrowser.SelectedPath

    $newpath > $settingsFile

    .\winscp.com /command "open ftp://lannetje:lan@192.168.178.49" "synchronize local """"$newpath"""" /" "exit"
} else {
    'Aborted...'
}
