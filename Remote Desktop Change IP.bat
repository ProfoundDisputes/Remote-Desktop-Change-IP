@echo off
fsutil dirty query %systemdrive% >nul
if NOT %errorLevel% == 0 ( 
	echo Please run as Administrator
	pause > nul
	exit
)
 
ECHO Now changing "Ethernet 2" IP address to 169.254.255.253
ECHO Now changing "Ethernet 2" subnet mask to 255.255.255.0
ECHO.
netsh interface ipv4 set address name="Ethernet 2" static 169.254.255.253 255.255.255.0
ECHO You should now be able to remote into server...
mstsc
pause
cls
ipconfig
ECHO.
pause
cls
ECHO Will revert "Ethernet 2" IPv4 to DHCP
ECHO.
pause
netsh interface ipv4 set address name="Ethernet 2" dhcp
ipconfig
ECHO.
ECHO.
ECHO "Ethernet 2" IPv4 should now be set to DHCP...Done...Press any key to exit...
pause > nul
