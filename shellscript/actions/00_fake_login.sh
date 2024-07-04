#!/usr/bin/env bash

# Present a fake login screen to the user.
#
# Credit: https://www.quora.com/Bash-shell-What-are-the-best-bashrc-pranks

export PS1="Login: " 

alias $(whoami)='stty -echo; echo -n "Password: ";read;echo;echo "Login failed.";stty echo' 
alias root='stty -echo; echo -n "Password: ";read;echo;echo "Login failed.";stty echo' 