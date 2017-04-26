#Change ProfileImagePath after migration with Powershell
#First part of our path to profile
$1Path = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
#Finding local user and replace domain tail
$User = (Get-ItemProperty -Path $1Path -Name ProfileImagePath).ProfileImagePath -like '*.IOMINT' -replace '.IOMINT'
#Finding SID and saving output into .txt file
$SID = Get-ItemProperty -Path $1Path | Where-Object {$_.ProfileImagePath -like '*.IOMINT'} |
     select  @{name="SID";expression={$_.PSChildName}} > C:\ProfileImagePath.txt
#Taking SID from .txt file and repalce all spaces
$ClearSID = Get-Content C:\ProfileImagePath.txt | select -First 1 -skip 3
$ReplaceClearSID = $ClearSID -replace ' ',''
#Building correct path and setting new value
$2Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\$ReplaceClearSID"
Set-ItemProperty -Path $2Path -Name ProfileImagePath -Value $User