@echo off
set MAX_RAM=5G
set JAR=forge-1.16.5-36.2.34.jar
set JAVA="C:\Program Files\Java\jdk1.8.0_322.6\bin\java.exe"


%JAVA% -Xmx%MAX_RAM% ^
-Dmixin.debug.export=true ^
-Dmixin.debug.verbose=true ^
-jar %JAR% nogui
