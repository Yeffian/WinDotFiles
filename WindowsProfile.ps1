Clear-Host
Write-Host All systems functional. Welcome, Jeff.


$version_major = (Get-Host).Version.Major
$version_minor = (Get-Host).Version.Minor
$host.UI.RawUI.WindowTitle = "Powershell Terminal v$version_major.$version_minor"


function Check-GitInstalled {
    try {
        git | Out-Null
        return $true
    } catch [System.Management.Automation.CommandNotFoundException] {
        return $false
    }
}

function Check-StarshipInstalled {
    try {
        starship | Out-Null
        return $true
    } catch [System.Management.Automation.CommandNotFoundException] {
        return $false
    }
}

# I have no clue how to make command aliases on windows so janky functions for the win ayee
# Jokes aside some of these could probably be simplified by adding the script to PATH or doskey
# and it probably should be because if i put too many functions in here it might start slowing down
# the shell as it has to load all these functions
# But im lazy so this works for now

function w { http 'wttr.in/?0' --body }

function weather { http 'wttr.in/?0' --body }

function time {
    $path = $PSScriptRoot + "/clock.txt"
    $text = Get-Content $path | Out-String
    $date = Get-Date

    Write-Host $text
    Write-Host ""
    Write-Host "Current date and time is: $date" 
}

if ( Check-GitInstalled -eq $true ) {
    if ( Check-StarshipInstalled -eq $true ) {
        Invoke-Expression (&starship init powershell)
    } else {
        Write-Error "You do not have Starship installed! Please install it from https://starship.rs/"
    }
} else {
    Write-Error "You do not have Git installed! Please install it from https://git-scm.com/"
}