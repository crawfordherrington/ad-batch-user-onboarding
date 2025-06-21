$OU = "OU=Employees,DC=contoso,DC=local"
$users = Get-ADUser -Filter * -SearchBase $OU

foreach ($user in $users) {
    try {
        Remove-ADUser -Identity $user.DistinguishedName -Confirm:$false
        Write-Host "Removed user: $($user.SamAccountName)"
    } catch {
        Write-Warning "Failed to remove user: $($user.SamAccountName) - $_"
    }
}
