Add-Type -AssemblyName System.Windows.Forms

$settingsFile = 'sync-games-path.txt'

$path = Get-Content $settingsFile
 
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    Description = 'Pick the path you want the games synced to'
    RootFolder = 0x11
    ShowNewFolderButton = $True
    SelectedPath = $path
}
 
[void]$FolderBrowser.ShowDialog()
$newpath = $FolderBrowser.SelectedPath

$newpath > $settingsFile

.\winscp.com /command "open ftp://lannetje:lan@192.168.178.49" "synchronize local -delete ""$newpath"" /" "exit"