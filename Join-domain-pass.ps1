$domain = "IOMINT"
$password = "matrix@neo2017" | ConvertTo-SecureString -asPlainText -Force
$username = "$domain\aborisenkoff" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)
Add-Computer -DomainName $domain -Credential $credential