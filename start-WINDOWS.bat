@echo off
set MAX_RAM=5G
set JAR=forge-1.16.5-36.2.34.jar

java -Xmx%MAX_RAM% ^
--add-exports=java.base/sun.security.util=ALL-UNNAMED ^
--add-opens=java.base/java.util.jar=ALL-UNNAMED ^
--add-opens=java.base/java.lang=ALL-UNNAMED ^
-jar %JAR% nogui