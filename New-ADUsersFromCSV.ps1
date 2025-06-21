$csvPath = "$PSScriptRoot\users.csv"

if (!(Test-Path $csvPath)) {
    Write-Error "CSV file not found at $csvPath"
    exit
}

$users = Import-Csv $csvPath

foreach ($user in $users) {
    try {
        $FirstName = $user.FirstName
        $LastName = $user.LastName
        $Username = ($FirstName.Substring(0,1) + $LastName).ToLower()
        $UPN = "$Username@contoso.local"
        $OU = "OU=Employees,DC=contoso,DC=local"
        $Password = ConvertTo-SecureString "TempP@ssw0rd123" -AsPlainText -Force

        if (Get-ADUser -Filter {SamAccountName -eq $Username} -ErrorAction SilentlyContinue) {
            Write-Warning "User $Username already exists. Skipping..."
            continue
        }

        New-ADUser `
            -Name "$FirstName $LastName" `
            -GivenName $FirstName `
            -Surname $LastName `
            -SamAccountName $Username `
            -UserPrincipalName $UPN `
            -Title $user.Title `
            -Department $user.Department `
            -AccountPassword $Password `
            -Enabled $true `
            -Path $OU `
            -ChangePasswordAtLogon $true

        Write-Host "Created user: $Username"
    } catch {
        Write-Error "Failed to create user: $($user.FirstName) $($user.LastName) - $_"
    }
}
