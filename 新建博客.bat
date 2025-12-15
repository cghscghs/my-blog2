@echo off
chcp 65001 >nul
echo ========================================
echo           一键创建新博客
echo ========================================
echo.

set /p title=请输入博客标题: 

if "%title%"=="" (
    echo 标题不能为空！
    pause
    exit
)

cd /d "%~dp0"
call npx hexo new "%title%"

echo.
echo ========================================
echo 文章创建成功！文件位置：
echo source\_posts\%title%.md
echo ========================================
echo.
echo 按任意键打开文章进行编辑...
pause >nul

start notepad "source\_posts\%title%.md"
