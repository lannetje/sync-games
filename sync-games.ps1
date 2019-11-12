Add-Type -AssemblyName System.Windows.Forms
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')

$pathFile = 'sync-games-path.txt'
$ipFile = 'sync-games-host.txt'

$path = Get-Content $pathFile
$serverIp = Get-Content $ipFile

$newServerIp = [Microsoft.VisualBasic.Interaction]::InputBox("Enter server IP", "IP", $serverIp)

$newServerIp > $ipFile

$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    Description = 'Pick the path you want the games synced to'
    RootFolder = 0x11
    ShowNewFolderButton = $True
    SelectedPath = $path
}

$result = $FolderBrowser.ShowDialog()

if ($result -eq [Windows.Forms.DialogResult]::Ok) {
    $newpath = $FolderBrowser.SelectedPath

    $newpath > $pathFile

    .\winscp.com /command "open ftp://lannetje:lan@$newServerIp" "synchronize local -criteria=none """"$newpath"""" /" "exit"
} else {
    'Aborted...'
}
