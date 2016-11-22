#!/bin/bash
SESSION='radar'

tmux new-session -d -s $SESSION

# create window to init vpn
tmux send-keys "cd ~/thesis/ugent-connect" C-m
tmux send-keys "clear" C-m
tmux send-keys "sudo openvpn intec-iGent.ovpn" C-m

# setup command for mosh
tmux new-window -t $SESSION:1
tmux send-keys "mosh vdutordoir@sumo-radar.intec.ugent.be"

# connect to vpn window to typ sudo password
tmux select-window -t $SESSION:0

# Attach to session
tmux attach-session -t $SESSION

