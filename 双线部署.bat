@echo off
chcp 65001 >nul
echo ========================================
echo   双线部署：同时部署到 Gitee + GitHub
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] 清理旧文件...
call npx hexo clean

echo.
echo [2/3] 生成静态文件...
call npx hexo generate

echo.
echo [3/3] 同时部署到 Gitee 和 GitHub...
call npx hexo deploy

echo.
echo ========================================
echo 双线部署完成！
echo.
echo 📍 Gitee（国内访问快）：
echo    https://你的用户名.gitee.io/仓库名
echo    ⚠️  记得去 Gitee 网站点击"更新"按钮！
echo.
echo 📍 GitHub（国际访问）：
echo    https://你的用户名.github.io
echo    ✅ 自动更新，无需手动操作
echo.
echo ========================================
echo.

pause
