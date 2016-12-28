@echo off

cls
:start
set /p get=请输入一个大于4的正整数：

if %get% lss 1 goto start
if %get% geq 1 goto panduan
goto:start

::计算圈数
:panduan
if %get% lss 4 goto start
set /a cf=get

set /a cf=%cf%/4
set /a yu=(%get%-%cf%*4)
set /a n=%cf%
set /a SR=%cf%+1


::画上半部分
setlocal enabledelayedexpansion
set /a T=%SR%
set /a Tz=!T!
for /l %%a in (1,1,%Tz%) do (
set table%%a=
set /a Ta=4*!T!-2
set table%%a=!table%%a!!Ta!
for /l %%b in (1,1,%%a) do set table%%a=★!table%%a!

set /a Tb=2*!T!-1
for /l %%c in (1,1,!Tb!) do set table%%a=!table%%a!★
set /a Tc=4*!T!-3
set table%%a=!table%%a!!Tc!
for /l %%d in (1,1,%%a) do set table%%a=!table%%a!★
echo !table%%a!
set /a T-=1

)
:: 画有0的中间行
setlocal enabledelayedexpansion
set /a T=%SR%
for /l %%m in (0,1,!T!) do set table=★!table!
set table=!table! 0
set /a Tx=!T!-1
for /l %%n in (0,1,%Tx%) do set table=!table!★
echo !table!

::画下半部分
set /a T=%SR%-1
set /a q=1
for /l %%j in (1,1,%T%) do (
set table%%q=
for /l %%k in (!n!,-1,0) do set table%%q=★!table%%q!
set /a Tp=4*%%j-1
set table%%q=!table%%q!!Tp!

set /a Ts=2*%%j-1
for /l %%z in (0,1,!Ts!) do set table%%q=!table%%q!★
set /a ones=4*%%j
set table%%q=!table%%q!!ones!
for /l %%m in (0,1,!n!) do set table%%q=!table%%q!★
echo !table%%q!
set /a q=!q!-1
set /a n=!n!-1

)



pause