@echo off
echo Running Git commands...

rem 切换到你的 Git 仓库目录
rem cd /d 

rem 执行 Git 命令
git add .
git commit -m "commit"
git pull
git push

echo All Git commands executed.
pause
