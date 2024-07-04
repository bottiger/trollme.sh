#!/usr/bin/env bash

source config.sh

if [ "$(id -u)" -eq 0 ]; then
    echo "Error: This script should not be run as root."
    exit 1
fi


mkdir -p $FOLDER_LOCATION

cp uninstall.sh $FOLDER_LOCATION
cp config.sh $FOLDER_LOCATION
./readme.sh $FOLDER_LOCATION/README.md
cp -r $SCRIPTS_FOLDER $FOLDER_LOCATION
cp troll.sh $FOLDER_LOCATION

install_date_content=$(cat <<-EOF
$HASHBANG

# Install by $SOURCE_NAMED from $WEBSITE_URL on the following date
echo "$(date)"
EOF
)

echo "$install_date_content" > $FOLDER_LOCATION/$INSTALL_DATE_SCRIPT
chmod +x $FOLDER_LOCATION/$INSTALL_DATE_SCRIPT


./dotprofile.sh