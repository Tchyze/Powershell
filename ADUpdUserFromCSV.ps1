$credential = Get-Credential

Import-Module ActiveDirectory

$csvPath = "C:\Path\to\your.csv"
$remoteADServer = "RemoteServer"
$searchBase = "OU=Your,DC=Search,DC=Base"

$data = Import-Csv $csvPath

foreach ($entry in $data) {
    $userName = $entry.DisplayName

    $user = Get-ADUser -Filter {DisplayName -eq $userName} -Properties DisplayName, GivenName, SurName, Title, Department, HomePhone, OfficePhone, MobilePhone, Fax, StreetAddress, City, PostalCode, State, Country, Office, Company, wWWHomePage -Server $remoteADServer -SearchBase $searchBase

    if ($user) {
        if ($entry.GivenName) {$user.GivenName = $entry.GivenName}
        if ($entry.SurName) {$user.SurName = $entry.SurName}
        if ($entry.Title) {$user.Title = $entry.Title}
        if ($entry.Department) {$user.Department = $entry.Department}
        if ($entry.HomePhone){$user.HomePhone = $entry.HomePhone}
        if ($entry.OfficePhone){$user.OfficePhone = $entry.OfficePhone}
        if ($entry.MobilePhone){$user.MobilePhone = $entry.MobilePhone}
        if ($entry.Fax){$user.Fax = $entry.Fax}
        if ($entry.StreetAddress){$user.StreetAddress = $entry.StreetAddress}
        if ($entry.City){$user.City = $entry.City}
        if ($entry.PostalCode){$user.PostalCode = $entry.PostalCode}
        if ($entry.State){$user.State = $entry.State}
        if ($entry.Country){$user.Country = $entry.Country}
        if ($entry.Office){$user.Office = $entry.Office}
        if ($entry.Company){$user.Company = $entry.Company}
        if ($entry.wWWHomePage){$user.wWWHomePage = $entry.wWWHomePage}

        Set-ADUser -Instance $user -Credential $credential
        
        Write-Host "User's information $userName updated."
    } else {
        Write-Host "User $userName Not find in your AD."
    }
}

$credential = "SCHEH"
Write-Host "Update Done."