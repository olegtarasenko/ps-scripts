$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\System\DNSClient'
Set-ItemProperty -Path $Path -Name 'NV PrimaryDnsSuffix' -Value ''
Set-ItemProperty -Path $Path -Name PrimaryDnsSuffix -Value ''