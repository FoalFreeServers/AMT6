#! /bin/bash


# Change arguments here
export MINECRAFTJAR=forge-1.16.5-36.2.34.jar
export RAM=12G
export JAVA=/home/sweetie/bin/jdk8u332-b09/bin/java


export LOCKFILE=minecraft.pid

if [ -f $LOCKFILE ]
then
echo 'it looks like minecraft is already running'
echo 'if you think that is wrong and theres a stale lockfile, here is the process:'
ps `cat $LOCKFILE`
echo '====='
echo "if there is no process, delete $LOCKFILE and run this script again"
exit
fi

# remove the lock file if control-c
trap "rm -f $LOCKFILE; exit" INT TERM EXIT

echo $$ > $LOCKFILE

while true;
do

ulimit -a

$JAVA -Xmx$RAM \
-Dmixin.debug.export=true \
-Dmixin.debug.verbose=true \
-jar $MINECRAFTJAR nogui

~/bin/backup-minecraft-full.sh

cd mods/
ls -lh *.jar > mods.txt
cd ..

git add .
git commit -m "Sync from Server."
git push

echo restarting in 5 seconds...
sleep 1
echo restarting in 4 seconds...
sleep 1
echo restarting in 3 seconds...
sleep 1
echo restarting in 2 seconds...
sleep 1
echo restarting in 1 second...
sleep 1

done

rm -f $LOCKFILE

