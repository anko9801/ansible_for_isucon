.PHONY: log
log:
	sudo journalctl -u -e $(SERVICE_NAME)

.PHONY: stat
stat:
	@tmux split-window -h -p 50
	@tmux split-window -v -p 50
	@tmux select-pane -t 0
	@tmux split-window -v -p 50
	@tmux send-keys -t 0 "sudo journalctl -u $(SERVICE_NAME) -f" C-m
	@tmux send-keys -t 2 "htop" C-m
	@tmux send-keys -t 3 "dstat" C-m

.PHONY: mysql
mysql:
	mysql -h$(DB_HOST) -P$(DB_PORT) -u$(DB_USER) -p$(DB_PASS) $(DB_NAME)