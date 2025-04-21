@echo off
:: BonOS 1.3
:: By AverageUser1231

:menu
cls
echo ============================
echo      Welcome to BonOS 1.3
echo        By AverageUser1231
echo ============================
echo 1. Open Notepad
echo 2. Launch Google
echo 3. Open Command Prompt
echo 4. Shut down the computer
echo 5. Restart the computer
echo 6. Check System Info
echo 7. Open File Explorer
echo 8. Visit Original Creator's GitHub
echo 9. Open a mysterious YouTube video
echo 10. Change Desktop Background
echo 11. Check CPU Usage
echo 12. Check Memory Usage
echo 13. Exit
echo ============================
set /p choice=Choose an option (1/2/3/4/5/6/7/8/9/10/11/12/13): 

if %choice%==1 (
    echo Launching Notepad...
    start notepad
    timeout /t 2 >nul
    goto menu
)

if %choice%==2 (
    echo Opening Google in your default browser...
    start https://www.google.com
    timeout /t 2 >nul
    goto menu
)

if %choice%==3 (
    echo Opening Command Prompt...
    start cmd
    timeout /t 2 >nul
    goto menu
)

if %choice%==4 (
    echo Shutting down your computer...
    shutdown /s /f /t 0
    exit
)

if %choice%==5 (
    echo Restarting your computer...
    shutdown /r /f /t 0
    exit
)

if %choice%==6 (
    echo Checking system info...
    systeminfo
    timeout /t 5 >nul
    goto menu
)

if %choice%==7 (
    echo Opening File Explorer...
    start explorer
    timeout /t 2 >nul
    goto menu
)

if %choice%==8 (
    echo Opening GitHub profile of the original creator...
    start https://github.com/AverageUser1231?tab=overview&from=2024-12-01&to=2024-12-23
    timeout /t 2 >nul
    goto menu
)

if %choice%==9 (
    echo Opening a mysterious YouTube video...
    start https://www.youtube.com/watch?v=dQw4w9WgXcQ
    timeout /t 2 >nul
    goto menu
)

if %choice%==10 (
    :: Check if running as Administrator to change background
    NET SESSION >nul 2>&1
    if %errorlevel% neq 0 (
        echo This script requires administrator privileges to change the desktop background.
        pause
        goto menu
    )

    echo Changing desktop background...
    powershell -Command "(Add-Type -MemberDefinition '[DllImport(""user32.dll"")] public static extern int SystemParametersInfo(int uiAction, int uiParam, string pvParam, int fWinIni);' -Name User32 -Namespace Win32Functions -PassThru)::SystemParametersInfo(20, 0, 'C:\path\to\your\image.jpg', 0x01 | 0x02)"
    if %errorlevel% neq 0 (
        echo Error changing background! Check if the image path is correct and permissions are granted.
        pause
    )
    timeout /t 2 >nul
    goto menu
)

if %choice%==11 (
    echo Checking CPU usage...
    typeperf "\Processor(_Total)\% Processor Time" -sc 1
    if %errorlevel% neq 0 (
        echo Error retrieving CPU usage. Please check your system settings.
        pause
    )
    timeout /t 2 >nul
    goto menu
)

if %choice%==12 (
    echo Checking memory usage...
    systeminfo | findstr "Memory"
    if %errorlevel% neq 0 (
        echo Error retrieving memory usage.
        pause
    )
    timeout /t 2 >nul
    goto menu
)

if %choice%==13 (
    echo Goodbye!
    timeout /t 2 >nul
    exit
)

:: Handle invalid input
echo Invalid choice, please try again.
timeout /t 2 >nul
goto menu
