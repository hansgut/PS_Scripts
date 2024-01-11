$firefoxPath = "C:\Program Files\Mozilla Firefox\firefox.exe"
$firefoxProcess = Get-Process | Where-Object {$_.ProcessName -eq "firefox"}
$firefoxProcess | Stop-Process

$password = Read-Host -Prompt "Enter password" -AsSecureString

$marshal = [Runtime.InteropServices.Marshal]

$plainPassword = $marshal::PtrToStringAuto($marshal::SecureStringToBSTR($password))


# Start-Process $firefoxPath
Start-Process $firefoxPath -ArgumentList "about:logins"

Start-Sleep -Seconds 6
Add-Type -AssemblyName System.Windows.Forms

[System.Windows.Forms.SendKeys]::SendWait("+{TAB}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{TAB}")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait($plainPassword)
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 2
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

$firefoxProcess = Get-Process | Where-Object {$_.ProcessName -eq "firefox"}
$firefoxProcess | Stop-Process

Start-Sleep -Seconds 4

Start-Process $firefoxPath
Start-Sleep -Seconds 6
[System.Windows.Forms.SendKeys]::SendWait("^+o")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("%")
#Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("i")
#Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("e")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")

$firefoxProcess = Get-Process | Where-Object {$_.ProcessName -eq "firefox"}
$firefoxProcess | Stop-Process
