@echo off
chcp 65001 >nul
echo ====================================
echo   博客更新并部署到 CloudBase
echo ====================================
echo.

echo [1/4] 清理旧文件...
call hexo clean

echo.
echo [2/4] 生成静态文件...
call hexo generate

echo.
echo [3/4] 部署到 CloudBase...
call tcb hosting:deploy public -e jianxin-blog-1gdvd9nob52e4ae5

echo.
echo [4/4] 推送到 Git 仓库...
git add .
git commit -m "更新博客内容 - %date% %time%"
git push origin main
git push gitee master

echo.
echo ====================================
echo   部署完成！
echo ====================================
echo.
echo 您的博客地址：
echo CloudBase: https://jianxin-blog-1gdvd9nob52e4ae5-1313178970.tcloudbaseapp.com
echo Vercel: https://my-blog2-amber.vercel.app
echo.
pause
