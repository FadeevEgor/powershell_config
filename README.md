# Powershell configuration file

## About 

The current version of the configuration file has two functions:
1. It changes the appearance of powershell prompt:
   - Only name of the current directory is shown. E.g. `projects` instead of `C:\Users\username\username` is displayed.
   - If the current directory is the home directory, the symbol "`~`" shown. E.g. `~` instead of `username` is displayed.
   - If the current directory is a git repository, the name of the active branch is displayed. 
2. It defines some useful commands and aliases:
   - `mkv` command creates a new python virtual environment in directory ".\venv".
   - `vrun` command activates the environment in ".\venv" directory.

The inspiration of the project is [oh-my-zsh](https://ohmyz.sh/) project.

## Installation

In order to use the configuration file on your system, you should place it at the location pointed by `$profile` command in PowerShell.
```powershell
$profile
```
The script "setup.ps1" will do exactly this. As alternative, the following command can be executed in PowerShell in the directory with the repository.
```powershell
cp Microsoft.PowerShell_profile.ps1 $profile
```
All the changes will be applied to all new sessions in PowerShell. 

## Customization  

The file provided can also be used as a starting point for your own configuration file. The author recommends to use  [The Windows PowerShell Integrated Scripting Environment (ISE)](https://learn.microsoft.com/en-us/powershell/scripting/windows-powershell/ise/introducing-the-windows-powershell-ise?view=powershell-7.2) which can be launched via following command in PowerShell.
```powershell
powershell_ise.exe
``` 