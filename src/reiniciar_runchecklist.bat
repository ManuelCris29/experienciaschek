@echo off
timeout /t 60 /nobreak >nul
net stop runchecklist
net start runchecklist
