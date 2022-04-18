'==========================================================================
'
' NAME: 	Set-Proxy.vbs
'
'
' DATE: 	15.04.2022
'
'
' COMMENT:	Set your own proxy server when group policy updated.
'
'
' TRIGGERS:
'				Begin the task: On an event
'				Event logs: System
'				Event sources: GroupPolicy (Microsoft-Windows-GroupPolicy)
'				Event IDs: 1500-1503
'
'				Begin the task: At log on
'				Specific user: domaintname\username
'
'==========================================================================
SleepTimer = 5000					        ' Sleep timer in milliseconds
ProxyServer = "10.100.1.254:8080"	' Proxy-server settings

WScript.Sleep(SleepTimer)

Dim WshShell
Set WshShell = CreateObject("WScript.Shell")

On Error Resume Next
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ProxyServer", ProxyServer, "REG_SZ"
