#Profile config - User: Leandro User E-mail: leandro@vipsolucoes.com

$env:LC_ALL = 'C.UTF-8'

# Functions
function viperp {
	set-location "D:\dev\VipERP"
}

function dev {
	set-location "D:\dev"
}

function temp {
	Set-Location "D:\temp"
}

function projects {
	Set-Location "D:\Projects"
}

# Git Posh
Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Avit

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete