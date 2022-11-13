Import-Module activedirectory

#Path isnt needed but its nice if you know where they need to go, without it the go to the USERS OU by default and you can move from there as needed.
#The Manager section in the CSV takes the Managers Distinguished Name. I found it easier to comment all the paths out for them in the script and paste them in the CSV as needed.
#Store the data from ADUsers.csv in the $ADUsers variable
$Users = Import-csv "PATH TO CSV HERE"

#Loop through each row containing user details in the CSV file 
foreach ($User in $Users) {
    # Read user data from each field in each row
    # the username is used more often, so to prevent typing, save that in a variable

        # create a hashtable for splatting the parameters
        $userProps = @{
            SamAccountName            = $User.SamAccountName                   
            #Path                                   = $User.path
            GivenName                       = $User.FirstName 
            Surname                           = $User.LastName
            Name                               = $User.FirstName.trim() + " " + $User.LastName.trim()
            DisplayName                   = $User.FirstName.trim() + " " + $User.LastName.trim()
            UserPrincipalName          = $user.UserPrincipalName 
            Department                     = $User.Department
            #Description                     = $User.Description
            Office                              = $User.Office
            Title                            = $User.Title
            Company                    = $User.Company
            EmailAddress               = $User.UserPrincipalName
            AccountPassword        = (ConvertTo-SecureString $User.Password -AsPlainText -Force)
            Manager                =   $User.Manager
            Enabled                      = $true
            ChangePasswordAtLogon      = $true
            #Country                      = $User.Country
            #Initials                               = $User.Initials
            #OfficePhone                   = $User.OfficePhone
            #StreetAddress                = $User.StreetAddress
            #POBox                            = $User.POBox
            #City                               = $User.City
            #State                            = $User.State
            #PostalCode                 = $User.PostalCode
        }   #end userprops   

         New-ADUser @userProps

    } #end else

#CN=EMPLOYEE FIRST LAST NAME,OU=,OU=Employees,OU=Accounts,DC=YOUR DOMAIN,DC=com
#CN=EMPLOYEE FIRST LAST NAME,OU=,OU=Employees,OU=Accounts,DC=YOUR DOMAIN,DC=com
#CN=EMPLOYEE FIRST LAST NAME,OU=,OU=Employees,OU=Accounts,DC=YOUR DOMAIN,DC=com
#CN=EMPLOYEE FIRST LAST NAME,OU=,OU=Employees,OU=Accounts,DC=YOUR DOMAIN,DC=com
#CN=EMPLOYEE FIRST LAST NAME,OU=,OU=Employees,OU=Accounts,DC=YOUR DOMAIN,DC=com	
