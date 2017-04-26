Param(
    [String]$computerName="ievpc-o-otar"
)
get-process -ComputerName $computerName | ?{$_.vm/1mb -gt 250} | Sort-Object -Descending vm