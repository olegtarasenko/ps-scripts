#Change ProfileImagePath after migration with Powershell 2.0 (?)
$1Path = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
$User = (Get-ItemProperty -Path $1Path -Name ProfileImagePath).ProfileImagePath -like '*.IOMINT' -replace '.IOMINT'
$SID = Get-ItemProperty -Path $1Path | Where-Object {$_.ProfileImagePath -like '*.IOMINT'} |
     select  @{name="SID";expression={$_.PSChildName}} > C:\ProfileImagePath.txt
$ClearSID = Get-Content C:\ProfileImagePath.txt
$ReplaceClearSID = $ClearSID -replace 'SID','' -replace '---',''
$2Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\$ReplaceClearSID" -replace ' ','' -replace 'WindowsNT', 'Windows NT'
Set-ItemProperty -Path $2Path  -Name ProfileImagePath -Value $User