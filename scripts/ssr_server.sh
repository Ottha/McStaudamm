#!/usr/bin/env bash

cd ..
SPIGOT_JAR=$(find * -maxdepth 1 -name 'spigot-*.jar');
echo "jar file found:"
echo $SPIGOT_JAR

case "$1" in
        start)
                screen -S minecraft_server
                java -Xms512M -Xmx2048M -XX:MaxPermSize=512M -jar $SPIGOT_JAR
                echo "Server wird gestartet, screen -r eingeben um den Serverlog anzuzeigen."
                ;;
        stop)
                screen -S minecraft_server -X stuff $'save-all\n'
                echo "Der Save-All-Befehl wurde an den Server gesendet."
                screen -S minecraft_server -X stuff $'stop\n'
                echo "Der Stop-Befehl wurde an den Server gesendet."
                ;;
#        clear)
#                echo -n > /home/lexat/mc_new/server.log
#                echo "server.log wurden geleert."
#                ;;
        view)
                screen -r minecraft_server
                ;;
#        backup)
#                tar cfv /home/lexat/backups/mc_backups/serverbackup.tar /home/lexat/mc_new
#                echo "Serverbackup beendet! Beginne mit dem komprimieren."
#                gzip /home/lexat/backups/mc_backups/serverbackup.tar
#                echo "Das eben erstellte Backup wurde erfolgreich komprimiert."
#                ;;
        *)
                echo "Verwende: ${0} {start|stop|clear|backup|view}"
                exit 2
esac
exit 0