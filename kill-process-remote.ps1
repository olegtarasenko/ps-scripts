(Get-WmiObject Win32_process -ComputerName ievpc-o-yzhi) | ?{$_.processname -match "outlook"}).terminate()