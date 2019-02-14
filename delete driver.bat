@echo off
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
echo 正在卸载虚拟分区/Deleting Virtual Disk mapping
title 正在卸载虚拟分区/Deleting Virtual Disk mapping
"%mountpath%" /d %driveletter% /f
echo 虚拟分区卸载完成/Virtual Disk mapping delete complete