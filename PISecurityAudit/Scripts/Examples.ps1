# Import the module
# This can be recorded inside your profile (.ps1) file
$modulePath = "<path to PISYSAUDIT folder>"
Import-Module $modulePath

# Example 1
# Example with all local and default parameters
piaudit

# Example 2
# Example with specific parameters for each server/PI Component.
$cpt = piauditparams $null "myPIServer" "PIDataArchive"
$cpt = piauditparams $cpt "myPIAFServer" "PIAFServer"
$cpt = piauditparams $cpt "mySQLServer" "SQLServer" -InstanceName "myinstance" # -IntegratedSecurity $false -user "sa" -pf "p1.dat"
$cpt = piauditparams $cpt "myCoresight" "PICoresightServer"
piaudit -cpt $cpt

# Example 3
# Save the password on disk
pwdondisk

# Example with specific parameters for each server/PI Component.
# Use the name of the password file to pass to use SQL Account authentication.
$cpt = piauditparams $null "myPIServer" "PIDataArchive"
$cpt = piauditparams $cpt "myPIAFServer" "PIAFServer"
$cpt = piauditparams $cpt "mySQLServer" "SQLServer" -InstanceName "myinstance" -IntegratedSecurity $false -user "sa" -pf "p1.dat"
$cpt = piauditparams $cpt "myCoresight" "PICoresightServer"
piaudit -cpt $cpt

# Example 4
# Example with specific parameters for each server/PI Component.
# You will be prompted for entering a password for the SQL Account authentication.
$cpt = piauditparams $null "myPIServer" "PIDataArchive"
$cpt = piauditparams $cpt "myPIAFServer" "PIAFServer"
$cpt = piauditparams $cpt "mySQLServer" "SQLServer" -InstanceName "myinstance" -IntegratedSecurity $false -user "sa"
$cpt = piauditparams $cpt "myCoresight" "PICoresightServer"
piaudit -cpt $cpt

# Example 5
# Disable the obfuscation of computer names in the report
piaudit -obf $false 

# Example 6
# Disable the output to screen when used with scheduled task.
piaudit -ShowUI $false 