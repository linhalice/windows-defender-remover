@set defenderremoverver=12.8
@setlocal DisableDelayedExpansion
@echo off
pushd "%CD%"
CD /D "%~dp0"

:: Bỏ qua phần Menu và đi thẳng đến nhãn :disablemitigations để tự động chọn tùy chọn "S"
goto disablemitigations

:--------------------------------------

:disablemitigations
CLS
bcdedit /set hypervisorlaunchtype off

CLS
echo Disabling Security Mitigations...
:: Registry Remove of Windows Defender
FOR /R %%f IN (Remove_SecurityComp\*.reg) DO PowerRun.exe regedit.exe /s "%%f"
CLS

:: Loại bỏ phần khởi động lại
echo Security mitigations have been disabled successfully.
pause
exit
