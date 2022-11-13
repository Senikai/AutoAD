AddNewUsersAD.ps1 and NewADUsers.CSV

Use the CSV and Ps1 mentioned above to add any number of users to your org. Path is not needed as noted in the PS1 but could be useful. 
Take note that the Managers field in the CSV need the DISTINGUISHED NAME, Ive left a example in there to help follow.
I find it easier to copy all the managers CSV Fields out of AD into the PS1 for a easy copy paste into the CSV since they will be open anyway at the same time.
The password is any default you wantto set, and will automatically be set to need changing when they login.


UPDATEAD ps1 and UpdateADUSERS.CSV
Use these two files to make changes and cleanup your user profiles.
Aslong as it can match the SAMname to the account, the changes will take effect.
I just used this on over 400 users without issue.
Very good when working in tandem with HR to make sure everyones title and managers match accordingly for offboarding and such.

ALLADUserAttributes.ps1

Use this to get all users in your org into a CSV that you can copy out into the UPdateADUSERS.csv and chage as needed before running the script UpdateAD.ps1
Puts the CSV in a nice temp folder on C: can obviously be changed.