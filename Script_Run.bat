@echo off

:: Tắt dịch vụ Windows Defender
sc stop WinDefend
sc config WinDefend start=disabled

:: Tắt dịch vụ bảo vệ theo thời gian thực của Windows Defender
PowerShell Set-MpPreference -DisableRealtimeMonitoring $true

:: Vô hiệu hóa Windows Defender Tamper Protection (nếu có thể)
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" /v TamperProtection /t REG_DWORD /d 0 /f

echo Windows Defender has been temporarily disabled. Please restart your system for complete removal.
pause
exit
