@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

echo Checking system dependencies...

python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed
    pause
    exit /b 1
)

if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

echo Activating virtual environment...
call venv\Scripts\activate.bat

if not defined VIRTUAL_ENV (
    echo Error: Failed to activate virtual environment
    pause
    exit /b 1
)

echo Installing dependencies...
venv\Scripts\python.exe -m pip install -q --upgrade pip
venv\Scripts\python.exe -m pip install -q -r requirements.txt

echo Launching ASLGIT...
venv\Scripts\python.exe aslgit.py %*

echo Opening https://anonseclab.org...
start https://anonseclab.org

endlocal
exit /b 0
