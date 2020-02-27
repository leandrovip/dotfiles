#Profile config - User: Leandro User E-mail: leandro@vipsolucoes.com

$env:LC_ALL='C.UTF-8'

# Functions
function viperp {
	set-location "D:\repositorio\VipERP"
}

function repo {
	set-location "D:\repositorio"
}

function repocomp{
	set-location "D:\RepositorioComponentes"
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete