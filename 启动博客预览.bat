@echo off
chcp 65001 >nul
echo ========================================
echo         启动 Hexo 博客预览服务器
echo ========================================
echo.
echo 启动中，请稍候...
echo.

cd /d "%~dp0"
call npx hexo clean
call npx hexo server

pause
