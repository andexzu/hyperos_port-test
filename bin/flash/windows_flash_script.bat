@echo off
cls
reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Nls\Language" /v InstallLanguage|find "0804">nul&& set LANG=Chinese
if "%LANG%"=="Chinese" (
    TITLE windows ˢ���ű� [����ѡ�д��ڣ���ס���Ҽ���س���Ŵ���С���ڻָ�]
) else (
    TITLE Windows Flash Script
)
color 3f
echo.
if exist "super.zst" (
    if "%LANG%"=="Chinese" (
        echo. ���ڽ�ѹsuper����,���ĵȴ�
    ) else (
        echo. Extracting the super image, wait patiently
    )
    bin\windows\zstd.exe --rm -d super.zst -o super.img
    if not "%errorlevel%" == "0" (
        if "%LANG%"=="Chinese" (
            echo. ת��ʧ��,��������˳�
        ) else (
            echo. Conversion failed. Press any key to exit
        )
        pause >nul 2>nul
        exit
    )
)

if "%LANG%"=="Chinese" (
    echo.
    echo. 1. ��������ˢ��
    echo.
    echo. 2. ˫��ˢ��
    echo.
    set /p input=��ѡ��-Ĭ��ѡ��1,�س�ִ��:
) else (
    echo.
    echo. 1. Preserve user data during flashing
    echo.
    echo. 2. Wiping data without wiping /data/media
    echo.
    set /p input=Please select - 1 is selected by default, and enter to execute:
)

if exist boot_tv.img (
    if "%LANG%"=="Chinese" (
	    echo. ˢ�������boot_tv.img
        
    ) else (
        echo. Flashing custom boot.img
    ) 
    bin\windows\fastboot.exe flash boot %~dp0boot_tv.img

) else (
    bin\windows\fastboot.exe flash boot %~dp0boot_official.img
)

REM firmware

bin\windows\fastboot.exe erase super
bin\windows\fastboot.exe reboot bootloader
ping 127.0.0.1 -n 5 >nul 2>nul
bin\windows\fastboot.exe flash super %~dp0super.img
if "%input%" == "2" (
	if "%LANG%"=="Chinese" (
	    echo. ����˫��ϵͳ,���ĵȴ�
    ) else (
        echo. Wiping data without wiping /data/media/, please wait patiently
    ) 
	bin\windows\fastboot.exe erase userdata
	bin\windows\fastboot.exe erase metadata
)

REM SET_ACTION_SLOT_A_BEGIN
if "%LANG%"=="Chinese" (
	echo. ���û����Ϊ 'a'��������ҪһЩʱ�䡣�����ֶ�����������ε������ߣ�������ܵ����豸��ש��
) else (
    echo. Starting the process to set the active slot to 'a.' This may take some time. Please refrain from manually restarting or unplugging the data cable, as doing so could result in the device becoming unresponsive.
)
bin\windows\fastboot.exe set_active a

REM SET_ACTION_SLOT_A_END

bin\windows\fastboot.exe reboot

if "%LANG%"=="Chinese" (
    echo. ˢ�����,���ֻ���ʱ��δ�������ֶ�����,��������˳�
) else (
    echo. Flash completed. If the phone does not restart for an extended period, please manually restart. Press any key to exit.
)
pause
exit
