@echo off
if not exist variables.txt copy variables_default.txt variables.txt
:0
for /f "skip=1 delims=" %%a in (variables.txt) do (
set mountpath=%%~a
goto :1
)
:1
for /f "skip=3 delims=" %%a in (variables.txt) do (
set vmdkpath=%%~a
goto :2
)
:2
for /f "skip=5 delims=" %%a in (variables.txt) do (
set partitionN=%%~a
goto :3
)
:3
for /f "skip=7 delims=" %%a in (variables.txt) do (
set driveletter=%%~a
goto :4
)
:4
echo ���ڹ����������/Mounting Virtual Disk
title ���ڹ����������/Mounting Virtual Disk
"%mountpath%" %driveletter% "%vmdkpath%" /v:%partitionN%
echo ��������������/Virtual Disk Mount complete
pause