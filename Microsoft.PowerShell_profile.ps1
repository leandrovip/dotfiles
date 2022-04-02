#Profile config - User: Leandro User E-mail: leandro@vipsolucoes.com

$env:LC_ALL='C.UTF-8'

# Functions
function viperp {
	set-location "D:\dev\VipERP"
}

function mobile {
	set-location "D:\dev\VipERP.Mobile"
}

function dev {
	set-location "D:\dev"
}

function temp {
    Set-Location "D:\temp"
}

function exp {
    Invoke-Item "."
}

function mssql {
    Invoke-Expression "net start mssqlserver"
}

function emul {
    Invoke-Item "D:\Programas\scrcpy\scrcpy-noconsole.vbs"
}

# Git Posh
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme slim

Import-Module Terminal-Icons

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete