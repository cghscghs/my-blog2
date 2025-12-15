@echo off
chcp 65001 >nul
echo ========================================
echo       一键部署博客到 GitHub Pages
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] 清理旧文件...
call npx hexo clean

echo.
echo [2/3] 生成静态文件...
call npx hexo generate

echo.
echo [3/3] 部署到 GitHub...
call npx hexo deploy

echo.
echo ========================================
echo 部署完成！
echo 请访问: https://你的用户名.github.io
echo ========================================
echo.

pause
