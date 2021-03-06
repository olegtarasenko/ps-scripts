$1Path = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
Get-ItemProperty -Path $1Path | ? {$_.ProfileImagePath -like '*.IOMINT'} | select  @{name="SID";expression={$_.ProfileImagePath}} > C:\ProfileImagePath_1.txt
$ClearSID_1 = Get-Content C:\ProfileImagePath_1.txt
$ReplaceClearSID_1 = $ClearSID_1 -replace 'SID','' -replace '---','' -replace '.IOMINT' -replace ' ', ''
$ReplaceClearSID_1 = $ReplaceClearSID_1 | ?{$_.trim() -ne ""}
$ReplaceClearSID_1 | out-file C:\ProfileImagePath_2.txt 
$SID = Get-ItemProperty -Path $1Path | Where-Object {$_.ProfileImagePath -like '*.IOMINT'} | select  @{name="SID";expression={$_.PSChildName}} > C:\ProfileImagePath_3.txt
$ClearSID_2 = Get-Content C:\ProfileImagePath_3.txt
$ReplaceClearSID_2 = $ClearSID_2 -replace 'SID','' -replace '---',''
$2Path = ("HKLM:\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\ProfileList\" + $ReplaceClearSID_2) -replace ' ','' -replace 'WindowsNT', 'Windows NT'
Set-ItemProperty -Path $2Path  -Name ProfileImagePath -Value $ReplaceClearSID_1