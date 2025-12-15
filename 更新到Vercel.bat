@echo off
chcp 65001 >nul
echo ========================================
echo      更新博客并自动部署到 Vercel
echo ========================================
echo.

cd /d "%~dp0"

set /p message=请输入更新说明（直接回车默认为"更新博客"）: 

if "%message%"=="" set message=更新博客

echo.
echo [1/3] 添加所有更改...
git add .

echo.
echo [2/3] 提交到本地...
git commit -m "%message%"

echo.
echo [3/3] 推送到 GitHub...
git push

echo.
echo ========================================
echo ✅ 已推送到 GitHub！
echo.
echo Vercel 正在自动部署中...
echo 请等待 1-2 分钟后访问你的博客
echo.
echo 博客地址: https://你的项目名.vercel.app
echo ========================================
echo.

pause
