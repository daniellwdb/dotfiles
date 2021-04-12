# Create symlink for Visual Studio Code settings.json
New-Item -Path "$($env:APPDATA)\Code\User\settings.json" -ItemType SymbolicLink -Value "$($PSScriptRoot).\vscode\settings.json"

# Install Visual Studio Code extensions
Get-Content "$($PSScriptRoot).\vscode\extensions.windows" | ForEach-Object { code --install-extension $_ }

# Create symlink for Windows Terminal settings.json
New-Item -Path "$($env:LOCALAPPDATA)\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Value "$($PSScriptRoot).\windows\wt\settings.json"

# Create symlink for .wslconfig
New-Item -Path "$($env:USERPROFILE)\.wslconfig" -ItemType SymbolicLink -Value "$($PSScriptRoot).\windows\.wslconfig"
