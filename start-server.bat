@echo off
title Server Portal Tugu Asri
cd /d "%~dp0"

echo ==================================================
echo   Menjalankan Server Portal Tugu Asri (tanpa browser)
echo   Tekan Ctrl+C untuk menghentikan server.
echo ==================================================
echo.

sc query postgresql-x64-17 | findstr /I "RUNNING" >nul
if errorlevel 1 (
  echo [PERINGATAN] Service postgresql-x64-17 belum berjalan atau tidak terdeteksi.
  echo Pastikan PostgreSQL lokal aktif sebelum menggunakan aplikasi.
  echo.
)

call pnpm dev
if errorlevel 1 (
  echo.
  echo [ERROR] Server Portal Tugu Asri berhenti dengan kode error %ERRORLEVEL%.
  pause
)
