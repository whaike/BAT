@echo off
:loop
cls
echo     * * * * * * * * * * * * * * * * * *
echo     *                                 *
echo     *  ��ӭʹ���ļ����ҹ���           *
echo     *  ���ҷ�ʽ:                      *
echo     *  (1) ��ȷ����(Ч�ʽϸ�)         *
echo     *  (2) ģ������(Ч�ʽϵ�)         *
echo     *                                 *
echo     * * * * * * * * * * * * * * * * * *
echo]

set /p cho=ѡ����ҷ�ʽ:
title "FAT�ļ����ҹ��� "
if "1" == "%cho%" goto:JQCZ
if "2" == "%cho%" goto:MHCZ
title "�����������������룡"
goto:loop


:JQCZ
set /p name=������Ҫ���ҵ��ļ���:
set /p pan=������Ҫ���ҵ��̷�(����d):
set panf=%pan%:\
cd /d "%panf%"
for /r %%n in (.) do (
echo ���ڲ���%%n\%name%
if exist "%%n\%name%" set namepath=%%n && call:goon
cls
) 
echo û�ҵ�������
pause
exit

:goon
echo %namepath%
cd "%namepath%"
start.
set /p choice=�Ƿ�������ң�(y/n):
if "y" == "%choice:~0,1%" goto:continue else exit
exit
:continue
goto:eof

exit
goto:eof



:MHCZ
set /p name=������Ҫ���ҵ��ļ���:
set /p pan=������Ҫ���ҵ��̷�(����d):
set panf=%pan%:\
cd /d "%panf%"
for /r %%n in (.) do (
echo ���ڲ���%%n\%name%
pushd "%%n\"
dir |find "%name%"
if not errorlevel 1 set namepath=%%n && call:goon
popd
cls
) 
echo û�ҵ�������
pause
exit

:goon
echo %namepath%
cd "%namepath%"
start.
set /p choice=�Ƿ�������ң�(y/n):
if "y" == "%choice:~0,1%" goto:continue else exit
exit
:continue
goto:eof

exit
goto:eof