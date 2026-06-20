@echo off
set VENV_DIR=venv
echo Проверяем наличие виртуального окружения...
echo Checking for a virtual environment...
if not exist "%VENV_DIR%" (
    echo Создаём виртуальное окружение...
    echo Creating a virtual environment...
    python -m venv "%VENV_DIR%"
    if %errorlevel% neq 0 (
        echo Ошибка: не удалось создать виртуальное окружение.
        echo Убедитесь, что установлен Python 3.x и модуль venv.
        echo Error: failed to create a virtual environment.
        echo Make sure that Python 3.x and the venv module are installed.
        pause
        exit /b 1
    )
)
echo Активируем виртуальное окружение...
echo Activating the virtual environment...
call "%VENV_DIR%\Scripts\activate.bat"
where pip >nul 2>&1
if %errorlevel% neq 0 (
    echo Ошибка: pip не найден в виртуальном окружении.
    echo Error: pip was not found in the virtual environment.
    pause
    exit /b 1
)
echo Устанавливаем зависимости...
echo We install dependencies...
pip install ^
    Flask==2.3.3 ^
    Werkzeug==2.3.7 ^
    Flask-SocketIO==5.3.6 ^
    gevent==24.2.1 ^
    gevent-websocket==0.10.1
if %errorlevel% neq 0 (
    echo Ошибка при установке зависимостей.
    echo Error when installing dependencies.
    pause
    exit /b 1
)
echo.
echo Все зависимсоти установлены. Нажмите любую клавишу для выхода...
echo All dependencies are installed. Press any key to exit...
pause
