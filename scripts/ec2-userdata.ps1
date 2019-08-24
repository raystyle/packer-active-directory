<powershell>
Write-Host "Setting up WinRM"

$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$winrm = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $winrm)
powershell.exe -ExecutionPolicy ByPass -File $winrm

Write-Host "Allowing WinRM in Host Firewall"
New-NetFirewallRule -Protocol TCP -LocalPort 5986 -Direction Inbound -Action Allow -DisplayName WinRM

# Memory Hotfix
Write-Host "Applying memory hotfix per ansible documentation"
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Install-WMF3Hotfix.ps1"
$file = "$env:temp\Install-WMF3Hotfix.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose

$launchConfig = Get-Content -Path C:\ProgramData\Amazon\EC2-Windows\Launch\Config\LaunchConfig.json | ConvertFrom-Json
$launchConfig.adminPasswordType = 'Specify'
$launchConfig.adminPassword = 'P@ssword1$'
$launchConfig
Set-Content -Value ($launchConfig | ConvertTo-Json) -Path C:\ProgramData\Amazon\EC2-Windows\Launch\Config\LaunchConfig.json
</powershell>
