# Import-Module syntax-highlighting
Import-Module PoshColor
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/zash.omp.json" | Invoke-Expression

Remove-Item Alias:history
Function nl {
  $input | Out-String -Stream | Select-String '.*' | Select-Object LineNumber, Line
}

Function history {
  type (Get-PSReadLineOption).HistorySavePath | nl
}

Function grep {
  $externalGrep = Get-Command -Type Application grep
  if ($MyInvocation.ExpectingInput) {
    $input | & $externalGrep --color $args
  } else {
    & $externalGrep --color $args
  }
}

function el { eza $args --long --all --header --time-style=long-iso --git --icons --group-directories-first --group -b }

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}