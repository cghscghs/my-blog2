@echo off
chcp 65001 >nul
echo ========================================
echo      一键部署博客到 Gitee Pages
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] 清理旧文件...
call npx hexo clean

echo.
echo [2/3] 生成静态文件...
call npx hexo generate

echo.
echo [3/3] 部署到 Gitee...
call npx hexo deploy

echo.
echo ========================================
echo 部署完成！
echo.
echo ⚠️  重要提示：
echo    1. 访问 https://gitee.com/jianxin_2453280367/jianxin-blog
echo    2. 点击"服务" → "Gitee Pages"
echo    3. 点击"启动"或"更新"按钮
echo    4. 等待几秒后访问你的博客
echo.
echo 博客地址: https://jianxin_2453280367.gitee.io/jianxin-blog
echo ========================================
echo.

pause
