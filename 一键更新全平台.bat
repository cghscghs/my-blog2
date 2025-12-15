@echo off
chcp 65001 >nul
echo ====================================
echo   博客一键更新到所有平台
echo ====================================
echo.
echo 将会更新到：
echo  ✓ CloudBase (国内访问)
echo  ✓ Vercel (国际访问)
echo  ✓ GitHub 仓库
echo  ✓ Gitee 仓库
echo.
pause

echo.
echo [1/5] 清理旧文件...
call hexo clean

echo.
echo [2/5] 生成静态文件...
call hexo generate

echo.
echo [3/5] 部署到 CloudBase...
call tcb hosting:deploy public -e jianxin-blog-1gdvd9nob52e4ae5

echo.
echo [4/5] 提交到 Git...
git add .
set /p commit_msg=请输入提交信息（直接回车使用默认）: 
if "%commit_msg%"=="" set commit_msg=更新博客内容 - %date% %time%
git commit -m "%commit_msg%"

echo.
echo [5/5] 推送到远程仓库...
echo 推送到 GitHub (Vercel 会自动部署)...
git push origin main
echo 推送到 Gitee...
git push gitee master

echo.
echo ====================================
echo   ✅ 所有平台更新完成！
echo ====================================
echo.
echo 📍 您的博客地址：
echo.
echo 🇨🇳 国内访问（CloudBase）:
echo    https://jianxin-blog-1gdvd9nob52e4ae5-1313178970.tcloudbaseapp.com
echo.
echo 🌍 国际访问（Vercel）:
echo    https://my-blog2-amber.vercel.app
echo.
echo 💡 提示：Vercel 需要等待 2-3 分钟自动构建完成
echo.
pause
