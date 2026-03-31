@echo off
echo ========================================
echo Dyslexia-Aid Setup Script
echo ========================================
echo.

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker is not installed. Please install Docker Desktop first.
    pause
    exit /b 1
)

REM Check if Docker Compose is installed
docker-compose --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker Compose is not installed. Please install Docker Compose first.
    pause
    exit /b 1
)

REM Create .env file if it doesn't exist
if not exist .env (
    echo [INFO] Creating .env file from .env.example...
    copy .env.example .env
    echo.
    echo [WARNING] Please update .env file with your API keys before continuing!
    echo.
    pause
)

REM Build and start services
echo [INFO] Building Docker images...
docker-compose build

echo [INFO] Starting services...
docker-compose up -d

echo ========================================
echo Setup complete!
echo ========================================
echo.
echo Access the application:
echo   Frontend (via Nginx): http://localhost
echo   Frontend (direct): http://localhost:5173
echo   Backend API (via Nginx): http://localhost/api
echo   Backend API (direct): http://localhost:8080/api
echo   MariaDB: localhost:3306
echo.
echo Default credentials:
echo   Admin: admin@dyslexia-aid.com / Admin123!
echo   Student: student@dyslexia-aid.com / Student123!
echo.
echo Useful commands:
echo   View logs: docker-compose logs -f
echo   Stop services: docker-compose down
echo.
pause
