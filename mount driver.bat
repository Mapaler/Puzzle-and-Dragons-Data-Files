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
echo 正在挂载虚拟分区/Mounting Virtual Disk
title 正在挂载虚拟分区/Mounting Virtual Disk
"%mountpath%" %driveletter% "%vmdkpath%" /v:%partitionN%
echo 虚拟分区挂载完成/Virtual Disk Mount complete
pause