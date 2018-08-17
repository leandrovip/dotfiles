#Profile config - User: Leandro User E-mail: leandro@vipsolucoes.com

$env:LC_ALL='C.UTF-8'

cd D:\Repositorio

# My functions
function repo { set-location "D:\Repositorio" }
function viperp { set-location "D:\Repositorio\VipERP" }

# Theme layout
Import-Module PSConsoleTheme
Set-ConsoleTheme 'Solarized Dark'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Posh-git
#Import-Module posh-git
#Import-Module oh-my-posh
#Set-Theme Paradox

# http://serverfault.com/questions/95431
function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    # https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt
    $origLastExitCode = $LastExitCode
    Write-VcsStatus

    if (Test-Administrator) {  # if elevated
        Write-Host "(Elevated) " -NoNewline -ForegroundColor White
    }

    Write-Host "$env:USERNAME@" -NoNewline -ForegroundColor Yellow
    Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    Write-Host $curPath -NoNewline -ForegroundColor Red
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    $LastExitCode = $origLastExitCode
    "`n$('>' * ($nestedPromptLevel + 1)) "
}

# Git
Import-Module posh-git
$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText  = '] '

# PSReadLine

Import-Module PSReadLine

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
# history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
