@echo off
chcp 65001 >nul
echo ========================================
echo      一键部署博客到 Vercel
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] 清理旧文件...
call npx hexo clean

echo.
echo [2/3] 生成静态文件...
call npx hexo generate

echo.
echo [3/3] 部署到 Vercel...
cd public
call npx vercel --prod

echo.
echo ========================================
echo 部署完成！
echo.
echo 查看你的博客地址（在上面的输出中）
echo ========================================
echo.

cd ..
pause
