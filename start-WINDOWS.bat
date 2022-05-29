@echo off
set MAX_RAM=5G
set JAR=forge-1.16.5-36.2.34.jar



:START
java -Xmx%MAX_RAM% --add-exports=java.base/sun.security.util=ALL-UNNAMED --add-opens=java.base/java.util.jar=ALL-UNNAMED -jar %JAR% nogui

echo Restarting automatically in 10 seconds (press Ctrl + C to cancel)
timeout /t 10 /nobreak > NUL
goto:START
pause
