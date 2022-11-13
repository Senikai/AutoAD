Import-Module activedirectory

$Users = Import-csv "PATH TO CSV HERE"
#The Manager section in the CSV takes the Managers Distinguished Name. I found it easier to comment all the paths out for them in the script and paste them in the CSV as needed.

#Loop through each row containing user details in the CSV file 
foreach ($User in $Users) {
    # Read user data from each field in each row
    # the username is used more often, so to prevent typing, save that in a variable

        # create a hashtable for splatting the parameters

            $userprops = @{
           Identity = $User.SamAccountname

           Replace = @{
            Department                     = $User.Department
            physicalDeliveryOfficeName                              = $User.Office
            Company                    = $User.Company
            Manager                =   $User.Manager
            Title                            = $User.Title
            Mail              = $User.UserPrincipalName
            GivenName                       = $User.FirstName 
            sn                           = $User.LastName

            #GivenName                       = $User.FirstName 
            #Surname                           = $User.LastName
            #DisplayName                   = $User.FirstName.trim() + " " + $User.LastName.trim()
            #Manager                =   $User.Manager
            #UserPrincipalName          = $user.UserPrincipalName 
            #EmailAddress               = $User.UserPrincipalName
            #Description                     = $User.Description
            #Country                      = $User.Country
            #Initials                               = $User.Initials
            #OfficePhone                   = $User.OfficePhone
            #StreetAddress                = $User.StreetAddress
            #POBox                            = $User.POBox
            #City                               = $User.City
            #State                            = $User.State
            #PostalCode                 = $User.PostalCode
            #Enabled                      = $true
            #ChangePasswordAtLogon      = $true
            #AccountPassword        = (ConvertTo-SecureString $User.Password -AsPlainText -Force)
            #Name                               = $User.FirstName.trim() + " " + $User.LastName.trim()
            #UserPrincipalName          = $user.UserPrincipalName
        }   #end userprops   
        }
         Set-ADUser @userprops
         }
    #end else
#CN=EMPLOYEE FIRST LAST NAME,OU=,OU=Employees,OU=Accounts,DC=YOUR DOMAIN,DC=com