@echo off
chcp 65001 >nul
echo ====================================
echo   快速更新到 CloudBase
echo ====================================
echo.

echo 正在重新生成并部署...
call hexo clean && hexo generate && tcb hosting:deploy public -e jianxin-blog-1gdvd9nob52e4ae5

echo.
echo ✅ 更新完成！
echo 📍 访问地址：https://jianxin-blog-1gdvd9nob52e4ae5-1313178970.tcloudbaseapp.com
echo.
pause
