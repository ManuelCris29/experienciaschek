@echo off
setlocal

set MYSQL_PASSWORD=D....odema18****

echo Autenticando en MySQL...
mysql -u root -p%MYSQL_PASSWORD% -e "exit"
if errorlevel 1 (
    echo  Falló la autenticación. Verifica la contraseña.
    pause
    exit /b 1
)

echo  Autenticación exitosa.
echo Esperando 2 minutos a que arranque MySQL...
timeout /t 120

echo Ejecutando guardar.py...
call python guardar.py

endlocal
