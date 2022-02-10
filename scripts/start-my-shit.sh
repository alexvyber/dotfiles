
if tmux has-session -t bg_tasks 2>/dev/null  ;  then
                                            echo "Session exists"
  ~/kill-my-shit.sh                 ;       echo "Killed session"
  tmux new-session -d   -t bg_tasks ;       echo "Session recreated"
else
                                            echo "doesn't exist"
  tmux new-session -d -t bg_tasks ;         echo "New Session created"
fi

#" isSessionExist=$()

isMongoRunning=$(awk -F' ' '{print $2}' <<< $(systemctl status mongod | grep Active ))

if [ $isMongoRunning == "active" ] ; then
                                          echo "mongod alredy runnig"
else
  sudo systemctl start mongod
                                          echo "started mongod"
fi  


tmux neww -t bg_tasks -d -n api_vy   bash -c 'cd ~/my/vyber/api && yarn develop'  ;  echo "Strapi started" 
tmux neww -t bg_tasks -d -n front_vy bash -c 'cd ~/my/vyber/front && yarn dev'    ;  echo "Frontend started"
sleep 2
tmux kill-window -t bg_tasks:zsh
 
