# Batch Active Directory User Onboarding with PowerShell

This project simulates a real-world onboarding workflow in a Windows Server environment. It uses PowerShell to batch-create Active Directory users from a CSV file and optionally remove them to reset the lab.

## What It Does

- Reads user data from `users.csv`
- Auto-generates usernames (e.g., jlee, mpatel)
- Sets department, title, and UPN
- Adds each user to the `Employees` Organizational Unit
- Enables accounts with a default password and login requirement
- Skips users if they already exist
- Includes a cleanup script to remove all test users from the OU

## Files

| File | Description |
|------|-------------|
| `users.csv` | Sample input with FirstName, LastName, Department, Title |
| `New-ADUsersFromCSV.ps1` | Main onboarding script |
| `Remove-ADTestUsers.ps1` | Cleanup script to delete users from `Employees` OU |
| `/screenshots` | Add images of ADUC, user properties, and script output |

## Sample Screenshots

- ADUC showing created users in the Employees OU
- User "Properties" window showing Title and Department
- PowerShell output from script execution

## How to Use

1. Run the onboarding script in PowerShell:

   ```
   .\New-ADUsersFromCSV.ps1
   ```

2. To remove all test users later:

   ```
   .\Remove-ADTestUsers.ps1
   ```

This project was completed in a VirtualBox-based Windows Server lab using AD DS and PowerShell 5.1.

## Skills Demonstrated

- PowerShell scripting
- Active Directory automation
- CSV parsing and validation
- Error handling and logging
- Organizational Unit management
