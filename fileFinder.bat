@echo off
:loop
cls
echo     * * * * * * * * * * * * * * * * * *
echo     *                                 *
echo     *  欢迎使用文件查找工具           *
echo     *  查找方式:                      *
echo     *  (1) 精确查找(效率较高)         *
echo     *  (2) 模糊查找(效率较低)         *
echo     *                                 *
echo     * * * * * * * * * * * * * * * * * *
echo]

set /p cho=选择查找方式:
title "FAT文件查找工具 "
if "1" == "%cho%" goto:JQCZ
if "2" == "%cho%" goto:MHCZ
title "输入有误，请重新输入！"
goto:loop


:JQCZ
set /p name=请输入要查找的文件名:
set /p pan=请输入要查找的盘符(例如d):
set panf=%pan%:\
cd /d "%panf%"
for /r %%n in (.) do (
echo 正在查找%%n\%name%
if exist "%%n\%name%" set namepath=%%n && call:goon
cls
) 
echo 没找到！！！
pause
exit

:goon
echo %namepath%
cd "%namepath%"
start.
set /p choice=是否继续查找？(y/n):
if "y" == "%choice:~0,1%" goto:continue else exit
exit
:continue
goto:eof

exit
goto:eof



:MHCZ
set /p name=请输入要查找的文件名:
set /p pan=请输入要查找的盘符(例如d):
set panf=%pan%:\
cd /d "%panf%"
for /r %%n in (.) do (
echo 正在查找%%n\%name%
pushd "%%n\"
dir |find "%name%"
if not errorlevel 1 set namepath=%%n && call:goon
popd
cls
) 
echo 没找到！！！
pause
exit

:goon
echo %namepath%
cd "%namepath%"
start.
set /p choice=是否继续查找？(y/n):
if "y" == "%choice:~0,1%" goto:continue else exit
exit
:continue
goto:eof

exit
goto:eof