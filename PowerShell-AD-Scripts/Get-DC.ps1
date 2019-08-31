$domain = [System.Directoryservices.Activedirectory.Domain]::GetCurrentDomain()
$domain | ForEach-Object {$_.DomainControllers} | 
ForEach-Object {
  $hostEntry= [System.Net.Dns]::GetHostByName($_.Name)
  New-Object -TypeName PSObject -Property @{
      Domain = $domain
      Name = $_.Name
      IPAddress = $hostEntry.AddressList[0].IPAddressToString
     }
} | Write-Host
# } | Export-CSV "DomainControllers.csv" -NoTypeInformation -Encoding UTF8