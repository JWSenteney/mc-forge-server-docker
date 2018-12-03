cp /minecraft/tmp/eula.txt /minecraft;
[ ! -f /minecraft/banned-ips.json ] && echo "[]" > /minecraft/banned-ips.json;
[ ! -f /minecraft/banned-players.json ] && touch /minecraft/banned-players.json;
[ ! -f /minecraft/ops.json ] && echo "[]" > /minecraft/ops.json;
[ ! -f /minecraft/server.properties ] && cp /minecraft/tmp/server.properties /minecraft;
[ ! -f /minecraft/whitelist.json ] && touch /minecraft/whitelist.json;