# Matt's Repeatable Install

This collection of scripts will install and configure software on
a machine to meet my preferences.

To run, execute the following command from a Powershell window:

```powershell
Set-ExecutionPolicy -F RemoteSigned CurrentUser ; iex (New-Object System.Net.WebClient).downloadstring('https://raw.githubusercontent.com/QuakeMatt/repeatable-install/master/iex.ps1')
```
