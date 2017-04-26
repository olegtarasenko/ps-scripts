$1Path = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
$UserLoc = (Get-ItemProperty -Path $1Path -Name ProfileImagePath).ProfileImagePath -like '*.IOMINT' -replace '.IOMINT'
$SID = Get-ItemProperty -Path $1Path | Where-Object {$_.ProfileImagePath -like '*.iomint*'} |
     select  @{name="SID";expression={$_.PSChildName}} > C:\ProfileImagePath.txt
$ClearSID = Get-Content C:\ProfileImagePath.txt | select -First 1 -skip 3
$ReplaceClearSID = $ClearSID -replace ' ',''
$2Path = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\$ReplaceClearSID"
Set-ItemProperty -Path $2Path -Name ProfileImagePath -Value $UserLoc