 #Profile config - User: Leandro User E-mail: leandro@vipsolucoes.com

$env:LC_ALL='C.UTF-8'
$MaximumHistoryCount = 20000

# Import Modules
Import-Module posh-git
Import-Module Terminal-Icons
Import-Module PsReadLine

# Functions
function Add-Alias($name, $alias) {
    $func = @"
function global:$name {
    `$expr = ('$alias ' + (( `$args | % { if (`$_.GetType().FullName -eq "System.String") { "``"`$(`$_.Replace('``"','````"').Replace("'","``'"))``"" } else { `$_ } } ) -join ' '))
    write-debug "Expression: `$expr"
    Invoke-Expression `$expr
}
"@
    write-debug "Defined function:`n$func"
    $func | iex
}

function viperp { set-location "D:\dev\VipERP" }
function sgi { set-location "D:\dev\Vip.SGI" }
function mobile { set-location "D:\dev\VipERP.Mobile" }
function migration { Invoke-Item "D:\dev\VipERP.Migrations\src\VipERP.Migrations\bin\Release\net6.0-windows\VipERP.Migrations.exe" }
function emul { Invoke-Item "D:\Programas\scrcpy\scrcpy-noconsole.vbs" }

function dev { set-location "D:\dev" }
function temp { Set-Location "D:\temp" }
function exp { Invoke-Item "." }
function la() { Get-ChildItem | Format-Wide }
function tail { Get-Content $args -Tail 30 -Wait }

function take {
  New-Item -ItemType directory $args
  Set-Location "$args"
}

function mssql {
    $mssqlservice = 'MSSQL`$VIPSQLEXPRESS'
    Invoke-Expression "net start $mssqlservice"
}

function pushgit {
    $branch = $(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin $branch
}

# Git aliases
Add-Alias ab 'git ckb'
Add-Alias am 'git ck master'
Add-Alias ad 'git ck develop'
Add-Alias au 'git up'
Add-Alias al 'git l'
Add-Alias as 'git st'

# Oh-My-Posh
oh-my-posh init pwsh --config 'D:\Users\Leandro\AppData\Local\Programs\oh-my-posh\themes\takuya.omp.json' | Invoke-Expression

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# History definitions
$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

# Aliases
Set-Alias which Get-Command
Set-Alias open Invoke-Item

# Compute file hashes - useful for checking successful downloads
function md5    { Get-FileHash -Algorithm MD5 $args }
function sha1   { Get-FileHash -Algorithm SHA1 $args }
function sha256 { Get-FileHash -Algorithm SHA256 $args }

Clear-Host