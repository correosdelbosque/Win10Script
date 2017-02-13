##########
# Win10 Initial Setup Script Settings Menu
# 
# Author: Madbomb122
# Website: https://github.com/madbomb122/Win10Script
# Version: 0.0, 02-13-2017
# 
# Release Type: Work in Progress
##########

# At the moment the Script will ONLY display items
# The save/load works but nothing to load/save ATM

# This script it to make selection of settings easier

# This script it ment to
# 1. Make a file with your wanted settings
# 2. Edit Settings file (what you load)
# 3. Run script with setting inputed/loaded

# When done will be part of the main script with ability
# to bypass Menu for Automation

## Remove the Bellow ITEM when done
# predefined Color Array
$colors = @(
     "black",        #0
     "blue",         #1
     "cyan",         #2
     "darkblue",     #3
     "darkcyan",     #4
     "darkgray",     #5
     "darkgreen",    #6
     "darkmagenta",  #7
     "darkred",      #8
     "darkyellow",   #9
     "gray",         #10
     "green",        #11
     "magenta",      #12
     "red",          #13
     "white",        #14
     "yellow"        #15
)
## Remove the Above ITEM when done

##########
# Version Info -Start
##########

$CurrVer = "0.0 (02-11-17) "
$RelType = "Beta   "
#$RelType = "Stable "

##########
# Version Info -End
##########

##########
# Menu Display Items -Start
##########

$MainMenuItems = @(
'                    Main Menu                     ',
'1. Run Script          ','H. Help                ',
'2. Script Settings     ','C. Copyright           ',
'3. Load Setting        ','A. About/Version       ',
'4. Save Setting        ','                       ',
'5. Script Option       ','                       ',
'Q. Exit/Quit                                      '
)

$ScriptSettingsMainMenuItems = @(
'             Script Setting Main Menu             ',
'1. Privacy Settings    ','7. Windows Update      ',
'2. Service Tweaks      ','8. Context Menu        ',
'3. Start Menu          ','9. Task Bar            ',
'4. Lock Screen         ','10. Features           ',
"5. 'This PC'           ",'11. Metro Apps         ',
'6. Explorer            ','12. Misc/Photo Viewer  ',
'B. Back to Main Menu                              '
)

$SettingFileItems = @(
'                   Setting File                   ',
'                                                 ',
'            Please Input Filename.               ',
'0. Cancel/Back to Main Menu                       '
)

$ConfirmMenuItems1 = @(
'                  Confirm Dialog                  ',

'              Are You sure? (Y/N)                ',
'0. Cancel/Back to Main Menu                       '
)

$ConfirmMenuItems2 = @(
'                  Confirm Dialog                  ',
'                                                 ',
'  File Exists do you want to overwrite? (Y/N)    ',
'0. Cancel/Back to Main Menu                       '
)

$HelpItems = @(
'                       Help                       ',
'                                                 ',
' Basic Usage:                                    ',
' Use the menu & select what you want to change.  ',
'                                                 ',
' Advanced Usage Choices (Bypasses Menu):         ',
' 1. Edit the script & change values there then   ',
'        run script with "-set Run"               ',
' 2. Run Script with importing a file with        ',
'        "-set filename"                          ',
' 3. Run Script with Window Default Values with   ',
'        "-set WD" or "-set WindowsDefault"       ',
'                                                 ',
' Examples:                                       ',
'    Win10-Mod.ps1 -set Run                       ',
'    Win10-Mod.ps1 -set Settings.xml              ',
'    Win10-Mod.ps1 -set WD                        ',
'                                                 ',
'Press "Enter" to go back                          '
)

$AboutItems = @(
'                About this Script                 ',
'                                                 ',
' This script makes it easier to setup an         ',
' existing or new install with modded setting.    ',
'                                                 ',
' This script was made by Me (Madbomb122).        ',
'    https://github.com/madbomb122/Win10Script    ',
'                                                 ',
' Original basic script was made by Disassembler  ',
'    https://github.com/Disassembler0/            ',
'                                                 ',
"Press 'Enter' to go back                          "
)

$CopyrightItems = @(
'                     Copyright                    ',
'                                                 ',
' Copyright (c) 2017 Disassembler -Original       ',
' Copyright (c) 2017 Madbomb122 -This Script      ',
' This program is free software: you can          ',
' redistribute it and/or modify This program is   ',
' free software This program is free software:    ',
' you can redistribute it and/or modify it under  ',
' the terms of the GNU General Public License as  ',
' published by the Free Software Foundation,      ',
' version 3 of the License.                       ',
'                                                 ',
' This program is distributed in the hope that it ',
' will be useful, but WITHOUT ANY WARRANTY;       ',
' without even the implied warranty of            ',
' MERCHANTABILITY or FITNESS FOR A PARTICULAR     ', 
' PURPOSE.  See the GNU General Public License    ', 
' for more details.                               ',
'                                                 ', 
' You should have received a copy of the GNU      ',
' General Public License along with this program. ',
' If not, see <http://www.gnu.org/licenses/>.     '
)

##########
# Menu Display Items -End
##########

# Used to get all values BEFORE any defined so 
# when exporting shows ALL defined after this point
$AutomaticVariables = Get-Variable

##########
# Menu Display Function -Start
##########

# Displays Menu items but has Seperators
function MenuDisplay ([Array]$ToDisplay, [Int]$MM) {
    TitleBottom $ToDisplay[0] 11
	Write-host "|                         |                         |" -Background Black 
    for ($i=1; $i -lt $ToDisplay.length-1; $i++) {
	    Write-host -NoNewline "|  " -Background Black ;Write-Host -ForegroundColor Cyan -Background Black -NoNewline $ToDisplay[$i];Write-Host -NoNewline "|  " -Background Black ;Write-Host -ForegroundColor Cyan -Background Black -NoNewline $ToDisplay[$i+1];Write-Host "|" -Background Black 
        $i++ 
    }
	Write-host "|                         |                         |" -Background Black 
    TitleBottom $ToDisplay[$ToDisplay.length-1] 13
	Website
}

# To display Settings Item with Choices for it
# 1-2 are for description
# For loop = Choices
# $ChToDisplayVal = Current Value
function ChoicesDisplay ([Array]$ChToDisplay,[Int]$ChToDisplayVal) {
    TitleBottom $ChToDisplay[0] 11
	Write-host "|                                                   |" -Background Black 
    Write-host -NoNewline "|  " -Background Black ;Write-Host -ForegroundColor Cyan -NoNewline $ChToDisplay[1];Write-Host "|" -Background Black 
    Write-host -NoNewline "|  " -Background Black ;Write-Host -ForegroundColor Cyan -NoNewline $ChToDisplay[2];Write-Host "|" -Background Black 
	Write-host "|                                                   |" -Background Black 
    Write-host "|---------------------------------------------------|" -Background Black 
	Write-host "|                                                   |" -Background Black 
    for ($i=3; $i -lt $ChToDisplay.length-1; $i++) {
	    Write-host -NoNewline "|  " -Background Black ;Write-Host -ForegroundColor Cyan -Background Black -NoNewline $ChToDisplay[$i];Write-Host "|" -Background Black 
    }
	Write-host "|                                                   |" -Background Black 
    Write-host "|---------------------------------------------------|" -Background Black 
	Write-host -NoNewline "|  " -Background Black ;Write-Host -ForegroundColor Cyan -Background Black -NoNewline "Current Value: "$ChToDisplayVal;Write-Host "|" -Background Black 
    Write-host "|---------------------------------------------------|" -Background Black 
    TitleBottom $ChToDisplay[$ChToDisplay.length-1] 13
	Website
}

# Displays items but NO Seperators
function VariableDisplay ([Array]$VarToDisplay) {
    TitleBottom $VarToDisplay[0] 11
    for ($i=1; $i -lt $VarToDisplay.length-1; $i++) {
	    Write-host -NoNewline "|  " -Background Black ;Write-Host -ForegroundColor Cyan -Background Black -NoNewline $VarToDisplay[$i];Write-Host "|" -Background Black 
    }
    TitleBottom $VarToDisplay[$VarToDisplay.length-1] 16
}

# Displays Title of Menu but with color choices
function TitleBottom ([String]$TitleA,[Int]$TitleB) {
    Write-host "|---------------------------------------------------|" -Background Black 
	If($TitleB -eq 16) {
	    Write-host -NoNewline "| " -Background Black ;Write-Host -ForegroundColor Yellow -BackgroundColor Black -NoNewline "Current Version:"$CurrVer;Write-Host "|" -Background Black -NoNewline;Write-Host -ForegroundColor Red -Background Black -NoNewline " Release:"$RelType;Write-Host "|" -Background Black 
    } Else {
	    Write-host -NoNewline "| " -Background Black ;Write-Host -ForegroundColor $colors[$TitleB] -Background Black -NoNewline $TitleA;Write-Host "|" -Background Black 	
	}
	Write-host "|---------------------------------------------------|" -Background Black 
}

function Website {
    Write-host -NoNewline "|" -Background Black ;Write-Host -ForegroundColor Yellow -BackgroundColor Black -NoNewline "     https://github.com/madbomb122/Win10Script     ";Write-Host "|" -Background Black 
    Write-host "|---------------------------------------------------|" -Background Black 
}

##########
# Menu Display Function -End
##########

##########
# Main Menu -Start
##########

function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne "Out"){
        Clear-Host
		MenuDisplay $MainMenuItems 0
		If($Invalid -eq 1){
		    Write-host ""
			Write-host "Invalid Selection" -ForegroundColor Red -BackgroundColor Black -NoNewline
			$Invalid = 0
		}
		$mainMenu = Read-Host "`nSelection"
		switch ($mainMenu) {
            1 {""} #Run Script
            2 {ScriptSettingsMM} #Script Settings Main Menu
            3 {LoadSetting} #Load Settings
            4 {SaveSetting} #Save Settings
            5 {""} #Script Options
            H {HelpMenu} #Help
            A {AboutMenu}  #About/Version
            C {CopyrightMenu}  #Copyright
			Q {$mainMenu = "Out"} 
            default {$Invalid = 1}
        }
    }
}

##########
# Main Menu -End
##########

##########
# Script Settings -Start
##########

function ScriptSettingsMM {
    $ScriptSettingsMM = 'X'
    while($ScriptSettingsMM -ne "Out"){
        Clear-Host
		MenuDisplay $ScriptSettingsMainMenuItems 1
		If($Invalid -eq 1){
			Write-host ""
			Write-host "Invalid Selection" -ForegroundColor Red -BackgroundColor Black -NoNewline
			$Invalid = 0
		}
        $ScriptSettingsMM = Read-Host "`nSelection"
		switch ($ScriptSettingsMM) {
            1 {""} #Privacy Settings
            2 {""} #Service Tweaks
            3 {""} #Star Menu
            4 {""} #Lock Screen
            5 {""} #'This PC' 
            6 {""} #Explorer
            7 {""} #Windows Update
            8 {""} #Context Menu
            9 {""}} #Task Bar 
            10 {""} #Features
            11 {""} #Metro Apps
			12 {""} #Misc/Photo Viewer
            B {$ScriptSettingsMM = "Out"} 
            default {$Invalid = 1}
		}
    }
}

##########
# Script Settings -End
##########

##########
# Load Settings -Start
##########

function LoadSetting {
    $LoadSetting = 'X'
    while($LoadSetting -ne "Out"){
        Clear-Host
		VariableDisplay $SettingFileItems
		If($Invalid -eq 1){
		    Write-host ""
			Write-host "No file with the name " $LoadSetting -ForegroundColor Red -BackgroundColor Black -NoNewline
			$Invalid = 0
		}
	# Add ability to load Win Default Values
        $LoadSetting = Read-Host "`nFilename"
		If ($LoadSetting -eq $null -or $LoadSetting -eq 0){
			$LoadSetting ="Out"
		} ElseIf (Test-Path $LoadSetting -PathType Leaf){
			$Conf = ConfrmMenu 1
			If($Conf -eq $true){
			    Import-Clixml .\$LoadSetting | %{ Set-Variable $_.Name $_.Value }
				$LoadSetting = 0
			} Else {
				$LoadSetting = 0			    
			}
		} Else {
            $Invalid = 1
		}
    }
}

##########
# Load Settings -End
##########

##########
# Save Settings -Start
##########

function SaveSetting {
    $SaveSetting = 'X'
    while($SaveSetting -ne "Out"){
        Clear-Host
		VariableDisplay $SettingFileItems
		$SaveSetting = Read-Host "`nFilename"
		If ($LoadSetting -eq $null -or $LoadSetting -eq 0){
			$SaveSetting = "Out"	
		} Else {
			If (Test-Path $SaveSetting -PathType Leaf){
			    $Conf = ConfirmMenu 2
			    If($Conf -eq $true){
			        cmpv | Export-Clixml .\$SaveSetting
			    }		    
		    } Else {
			    cmpv | Export-Clixml .\$SaveSetting
		    }
			$SaveSetting = "Out"	
		}
    }
}

##########
# Save Settings -End
##########

##########
# Info Display Stuff -Start
##########

function HelpMenu {
    $HelpMenu = 'X'
    while($HelpMenu -ne "Out"){
        Clear-Host
		VariableDisplay $HelpItems 0
        $HelpMenu = Read-Host "`nPress 'Enter' to continue"
		switch ($HelpMenu) {
            default {$HelpMenu = "Out"}
        }
    }
}

function AboutMenu {
    $AboutMenu = 'X'
    while($AboutMenu -ne "Out"){
        Clear-Host
		VariableDisplay $AboutItems 0
        $AboutMenu = Read-Host "`nPress 'Enter' to continue"
		switch ($AboutMenu) {
            default {$AboutMenu = "Out"}
        }
    }
}

function CopyrightMenu {
    $AboutMenu = 'X'
    while($AboutMenu -ne "Out"){
        Clear-Host
		VariableDisplay CopyrightItems 0
        $AboutMenu = Read-Host "`nPress 'Enter' to continue"
		switch ($AboutMenu) {
            default {$AboutMenu = "Out"}
        }
    }
}

##########
# Info Display Stuff -End
##########

##########
# Multi Use Functions -Start
##########

# Used to Help remove the Automatic variables
function cmpv {
    Compare-Object (Get-Variable) $AutomaticVariables -Property Name -PassThru | Where -Property Name -ne "AutomaticVariables"
}

function ChoicesMenu($Vari,$Number) {
    $VariJ = -join($Vari,"Items")
    $VariV = Get-Variable $Vari -valueOnly #Variable
    $VariA = Get-Variable $VariJ -valueOnly #Array
    $ChoicesMenu = 'X'
    while($ChoicesMenu -ne "Out"){
        Clear-Host
		If($Invalid -eq 1){
		    Write-host ""
			Write-host "Invalid Selection" -ForegroundColor Red -BackgroundColor Black -NoNewline
			$Invalid = 0
		}
		ChoicesDisplay $VariA $VariV
        $ChoicesMenu = Read-Host "`nChoice"
    	switch ($ScriptSettingsMM) {
            0 {Return 0}
            1 {Return 1}
            2 {Return 2}
            3 {if($Number -ge 3) {Return 3} Else {$Invalid = 1}}
            4 {if($Number -eq 4) {Return 4} Else {$Invalid = 1}}
            C {Return $VariV} 
            default {$Invalid = 1}
		}
    } 
}

function ConfirmMenu([int] $Option) {
    $ConfirmMenu = 'X'
    while($ConfirmMenu -ne "Out"){
        Clear-Host
		If ($Option -eq 1){
			VariableDisplay $ConfirmMenuItems1
		} ElseIf ($Option -eq 2){
			VariableDisplay $ConfirmMenuItems2
		}
		$ConfirmMenu = Read-Host "`nSelection (Y/N)"
        switch (ConfirmMenu) {
			Y {Return $true}
            N {Return $false} 
		    default {Return $false}
		}
    } 
}

##########
# Multi Use Functions -End
##########


mainMenu
