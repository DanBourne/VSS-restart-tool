$Server = Read-Host -Prompt "Enter the server name"

Invoke-Command -ComputerName $Server -ScriptBlock {


#Create the Menu function

function Show-Menu 
{
    param (
        [string]$Title = 'VSS Writers'
        )
        Clear-Host
        vssadmin list writers
        Write-Host "==========VSS=========="
        Write-Host "1:  System Writer"
        Write-Host "2:  ASR Writer"
        Write-Host "3:  WMI Writer"
        Write-Host "4:  MSSearch Service Writer"
        Write-Host "5:  BITS Writer"
        Write-Host "6:  SQL Server Writer"
        Write-Host "7:  All VSS Writers"
        Write-Host "Q:  Quit"
   }     

#Create a do/while loop to allow multiple services to be restarted individually   
do {
Show-Menu -Title "Restart VSS Writers"
$Selection = Read-Host "Select a writer"

switch ($Selection)
    {
        '1'{
        Restart-Service -Name Cryptsvc -Force -Verbose
        }'2'{
        Restart-Service -Name VSS -Force -Verbose
        }'3'{
        Restart-Service -Name Winmgmt -Force -Verbose
        }'4'{
        Restart-Service -Name WSearch -Force -Verbose
        }'5'{
        Restart-Service -Name BITS -Force -Verbose
        }'6'{
        Restart-Service -Name SQLWriter -Force -Verbose
        }'7'{
        Restart-Service -Name CryptSvc,VSS,Winmgmt,WSearch,BITS -Force -Verbose
        }'Q' {
        return
        }
        }

}
 until ($selection -eq 'q')
 }
