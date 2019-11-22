
cd /d %~dp0
call cd ..
::call npm install forever -g
::call forever stopall
::call forever start --minUptime 1000 --spinSleepTime 1000 ./bin/www
::call npm start
call echo started
exit