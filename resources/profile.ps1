oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/emodipt-extend.omp.json" | Invoke-Expression
$Host.UI.RawUI.WindowTitle = 'Hello World!'
cls