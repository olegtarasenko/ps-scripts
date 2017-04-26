$join = Get-Content "D:\psfolder\joincomputerslist.txt"
Add-Computer -ComputerName $join -DomainName IOMINT -Credential iomint\aborisenkoff -Force