@setlocal enableextensions enabledelayedexpansion
@echo off

set ipaddr=%1
set outputfile=%2
set delay=%3

echo.Testing: %date% %time% Address:!ipaddr! Delay:!delay! seconds. >>!outputfile!
:loop

REM echo.Top of loop 

set !errorlevel!=0
ping -n 1 !ipaddr! >nul: 2>nul:
if NOT !errorlevel!==0 (
   echo.%date% %time% Address: !ipaddr! Link Not Responding. >>!outputfile!
  )

ping -n !delay! 127.0.0.1 >nul: 2>nul:

goto :loop
endlocal
 