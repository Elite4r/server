sudo apt-get update
sudo apt-get install tmux

#!/bin/bash

# Start a new tmux session
tmux new-session -d -s my_session

# Split the terminal horizontally
tmux split-window -h -t my_session

# Run the first command in the upper pane (first pane)
tmux send-keys -t my_session:0.0 'cd server && java -Xmx1024M -Xms1024M -jar server.jar nogui && cd ..' C-m

# Run the second command in the lower pane (second pane)
tmux send-keys -t my_session:0.1 'cd bungee && java -Xmx128M -Xms128M -jar bungee.jar nogui && cd ..' C-m

# Attach to the tmux session
tmux attach-session -t my_session
