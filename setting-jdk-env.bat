@echo off

:: set JAVA_HOME=%~dp0
:: %CD% 变量最后面没有反斜线
set JAVA_HOME=%CD%
setx JAVA_HOME "%JAVA_HOME%"
setx CLASSPATH ".;%JAVA_HOME%\jre\lib\rt.jar;%JAVA_HOME%\lib\tools.jar"

:: 当前用户 path 路径前加上 %java_home%\bin
set ok=0%
for /f "skip=2 tokens=3*" %%a in ('reg query HKCU\Environment /v PATH') do if [%%b]==[] ( setx PATH "%JAVA_HOME%\bin;%%~a" && set ok=1 ) else ( setx PATH "%JAVA_HOME%\bin;%%~a %%~b" && set ok=1)
if "%ok%" == "0" setx PATH "%JAVA_HOME%\bin"

pause