# Function to display ASCII banner
function Show-AsciiBanner {
    Write-Host @"
                                                            
    ____  ____ _      _____  ________  ____  __  ______ ___ 
   / __ \/ __ \ | /| / / _ \/ ___/ _ \/ __ \/ / / / __ `__ \
  / /_/ / /_/ / |/ |/ /  __/ /  /  __/ / / / /_/ / / / / / /
 / .___/\____/|__/|__/\___/_/   \___/_/ /_/\__,_/_/ /_/ /_/ 
/_/            
        Powershell Enumeration Script by wint3rmute                                 
                                                  
"@
}

# Function to search for files with passwords
function Search-FilesWithPasswords {
    param (
        [string]$searchPath
    )

    Get-ChildItem -Path $searchPath -Include *pass*.txt,*pass*.xml,*pass*.ini,*pass*.xlsx,*cred*,*vnc*,*.config*,*accounts* -File -Recurse -ErrorAction SilentlyContinue
}

# Display ASCII banner
Show-AsciiBanner

# Basic System Enumeration
Write-Host "`nSystem Enumeration:"
Get-ComputerInfo | Format-Table -AutoSize

# Environment Variables
Write-Host "`nEnvironment Variables:"
Get-ChildItem Env: | Format-Table -AutoSize

# Network Information
Write-Host "`nNetwork Information:"
ipconfig /all

# Connected Drives
Write-Host "`nConnected Drives:"
Get-Volume | Format-Table -AutoSize

# Firewall Configuration
Write-Host "`nFirewall Configuration:"
Get-NetFirewallProfile | Format-Table -AutoSize

# Internally Listening Ports
Write-Host "`nInternally Listening Ports:"
Get-NetTCPConnection | Where-Object { $_.State -eq 'Listen' } | Format-Table -AutoSize

# User Information
Write-Host "`nUser Information:"
$env:USERNAME
$env:USERDOMAIN

# User Privileges
Write-Host "`nUser Privileges:"
whoami /priv

# Local Users
Write-Host "`nLocal Users:"
Get-WmiObject Win32_UserAccount | Format-Table -AutoSize

# Local User Privileges
Write-Host "`nLocal User Privileges:"
Get-LocalUser | Format-Table -AutoSize

# Local Groups
Write-Host "`nLocal Groups:"
Get-LocalGroup | Format-Table -AutoSize

# Local Group Privileges
Write-Host "`nLocal Group Privileges:"
Get-LocalGroupMember Administrators | Format-Table -AutoSize

# User Directories
Write-Host "`nUser Directories:"
Get-ChildItem -Path "C:\Users\" -Directory | Format-Table -AutoSize

# Search for SAM backup files
Write-Host "`nSearching for SAM backup files:"
Search-FilesWithPasswords -searchPath "C:\" | Format-Table -AutoSize

# Search for SYSTEM files
Write-Host "`nSearching for SYSTEM files:"
Search-FilesWithPasswords -searchPath "C:\" | Format-Table -AutoSize

# List Running Processes
Write-Host "`nRunning Processes:"
Get-Process | Format-Table -AutoSize

# ... (continue with the rest of the tasks)

# Save Output to a .txt File
$filePath = Read-Host "Enter the full path to save the output (e.g., C:\output.txt)"
Get-Help | Out-File -FilePath $filePath

Write-Host "Script execution completed. Output saved to $filePath"
