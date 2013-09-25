#!/bin/zsh
if [ ! -d ${HOME}/terminal_log ]; then
	mkdir ${HOME}/terminal_log
fi

exec script ${HOME}/terminal_log/log_`date +%F_%H_%M`.log
