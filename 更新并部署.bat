@echo off
chcp 65001 >nul
echo ========================================
echo         更新博客并部署到远程
echo ========================================
echo.

cd /d "%~dp0"

set /p message=请输入提交信息（直接回车默认为"更新博客"）: 

if "%message%"=="" set message=更新博客

echo.
echo [1/4] 添加所有更改的文件...
git add .

echo.
echo [2/4] 提交到本地仓库...
git commit -m "%message%"

echo.
echo [3/4] 推送到 GitHub...
git push

echo.
echo [4/4] 等待自动部署...
echo.

echo ========================================
echo 部署完成！
echo.
echo GitHub Pages: https://你的用户名.github.io
echo Vercel: https://你的项目名.vercel.app
echo ========================================
echo.
echo 注意：Vercel 需要等待 1-2 分钟自动部署
echo.

pause
