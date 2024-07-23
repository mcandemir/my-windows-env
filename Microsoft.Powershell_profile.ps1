oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\zash.omp.json" | Invoke-Expression

Import-Module PSReadLine

function el { eza $args --long --all --header --time-style=long-iso --git --icons --group-directories-first --group -b }

function elt { eza $args --long --all --header --time-style=long-iso --git --icons --group-directories-first --group -b --tree }