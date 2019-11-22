
cd /d %~dp0
call cd ..
::call cd config
::call xcopy /s .\test\* .\ /y
call npm install
exit