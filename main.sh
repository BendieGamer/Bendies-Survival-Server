#!/bin/bash

# Eaglercraft Server
# Thrown together in a few days by BendieGames
# Go love ayun, he gave me the idea.

unset DISPLAY

echo "set -g mouse on" > ~/.tmux.conf

sed -i "s/^  redirect_legacy_clients_to: .*\$/  redirect_legacy_clients_to: 'wss:\/\/$REPL_SLUG.$REPL_OWNER.repl.co\/old'/" bungee/plugins/EaglercraftXBungee/listeners.yml

tmux kill-session -t server
# Restart Caddyserver, portforwarding 8081 for Eaglercraft.
cd ./Caddy
caddy stop
caddy start --config ./Caddyfile > /dev/null 2>&1
cd ..
# Run Spigot Server
cd ./Spigot
tmux new -d -s server "java -Xmx512M -Xms512M -jar server.jar nogui; tmux kill-session -t server"
cd ..
# Run Waterfall/Bungeecord
cd ./Bungee
tmux splitw -t server -h "java -Xmx128M -Xms128M -jar bungee.jar; tmux kill-session -t server"
cd ..


while tmux has-session -t server
do
  tmux a -t server
done

caddy stop