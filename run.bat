@echo off
if exist "venv\Scripts\activate.bat" (
    call venv\Scripts\activate.bat
) else (
)
for /r "%USERPROFILE%" %%i in (.) do (
    if /i "%%~nxi"=="messenger" (
        set "APP_DIR=%%i"
        goto :found_dir
    )
)
echo ❌ Директория 'messenger' не найдена в домашней директории
echo ❌ The 'messenger' directory was not found in the home directory
exit /b 1
set "APP_PATH=%APP_DIR%\app.py"
if not exist "%APP_PATH%" (
    echo ❌ Файл app.py не найден в директории: %APP_DIR%
    echo ❌ File app.py not found in the directory: %APP_DIR%
    exit /b 1
)
echo 🚀 Запускаем: python3 %APP_PATH%
echo 🚀 Launching: python3 %APP_PATH%
echo Нажмите Ctrl+C для остановки
echo Press Ctrl+C to stop
python3 "%APP_PATH%"
echo Нажмите Enter для закрытия терминала...
echo Press Enter to close the terminal...
pause

