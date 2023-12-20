Import-Module ActiveDirectory

$ExportPath = "C:\Path\to\your.csv"
$RemoteServer = "RemoteServer"
$SearchBase = "OU=Your,DC=Search,DC=Base"

$users = Get-ADUser -Filter * -Properties DisplayName, GivenName, SurName, Mail, Title, Department, HomePhone, OfficePhone, MobilePhone, Fax, StreetAddress, City, PostalCode, State, Country, Office, Company, wWWHomePage -Server $RemoteServer -SearchBase $SearchBase

$users | Select-Object DisplayName, GivenName, SurName, Mail, Title, Department, HomePhone, OfficePhone, MobilePhone, Fax, StreetAddress, City, PostalCode, State, Country, Office, Company, wWWHomePage | Export-Csv -Path $ExportPath -NoTypeInformation