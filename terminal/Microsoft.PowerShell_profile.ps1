 #Profile config - User: Leandro User E-mail: leandro@vipsolucoes.com

$env:LC_ALL='C.UTF-8'

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

function viperp {
	set-location "D:\dev\VipERP"
}

function migration {
    Invoke-Item "D:\dev\VipERP.Migrations\src\VipERP.Migrations\bin\Release\net6.0-windows\VipERP.Migrations.exe"
}

function mobile {
	set-location "D:\dev\VipERP.Mobile"
}

function sgi {
	set-location "D:\dev\Vip.SGI"
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
    $mssqlservice = 'MSSQL`$VIPSQLEXPRESS'
    Invoke-Expression "net start $mssqlservice"
}

function emul {
    Invoke-Item "D:\Programas\scrcpy\scrcpy-noconsole.vbs"
}

# Git aliases
Add-Alias ab 'git ckb'
Add-Alias am 'git ck master'
Add-Alias ad 'git ck develop'
Add-Alias au 'git up'
Add-Alias al 'git l'
Add-Alias as 'git st'

function pushgit {
    $branch = $(git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin $branch
}

# Git Posh
Import-Module posh-git

oh-my-posh init pwsh --config 'D:\Users\Leandro\AppData\Local\Programs\oh-my-posh\themes\takuya.omp.json' | Invoke-Expression

Import-Module Terminal-Icons

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Clear-Host