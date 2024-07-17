#!/usr/bin/env bash

scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
source $scriptDir/config.sh
SOURCE_NAMED=$1

if [ "$(id -u)" -eq 0 ]; then
    echo "Error: This script should not be run as root."
    exit 1
fi



rm -rf $scriptDir/artifacts/*

cp $scriptDir/_headers $scriptDir/artifacts/
cp $scriptDir/_redirects $scriptDir/artifacts/

scripts=("troll.sh" "config.sh" "dotprofile.sh" "uninstall.sh" "installer.sh" "README.md" "readme.sh")
 
actions_dir="actions"

# Filnavn på installer-scriptet
installer_script_name="bundle.sh"
installer_script="$scriptDir/artifacts/$installer_script_name"

cp $scriptDir/bundle_template.sh $installer_script

# Funktion til at encode filer
encode_file() {
  local file="$1"
  base64 "$file" | tr -d '\n'
}

# Function to encode a folder as a tarball
encode_folder() {
  local folder="$1"
  tar -czf - "$folder" | base64 | tr -d '\n'
}

# Tilføj hver encoded script til installer-scriptet
echo '' >> "$installer_script"
echo '' >> "$installer_script"
for script in "${scripts[@]}"; do
  encoded_content=$(encode_file "$scriptDir/$script")
  echo "Creating $script..."
  echo "cat <<'EOF' | base64 --decode > $script" >> "$installer_script"
  echo "$encoded_content" >> "$installer_script"
  echo 'EOF' >> "$installer_script"
  echo 'chmod +x '"$script" >> "$installer_script"
  echo '' >> "$installer_script"
done


# Add the encoded folder tarball to the installer script
encoded_folder=$(encode_folder "$actions_dir")
echo "Creating $actions_dir folder..."
echo "mkdir -p $actions_dir" >> "$installer_script"
echo "cat <<'EOF' | base64 --decode | tar -xz -C $actions_dir --strip-components=1" >> "$installer_script"
echo "$encoded_folder" >> "$installer_script"
echo 'EOF' >> "$installer_script"
echo "chmod +x $actions_dir/*" >> "$installer_script"
echo '' >> "$installer_script"

# echo 'echo "All scripts have been created and made executable."' >> "$installer_script"

# Install the scripts
echo '' >> "$installer_script"
echo "./installer.sh \"\$@\"" >> "$installer_script"

# Giv installer-scriptet eksekveringsrettigheder
chmod +x "$installer_script"

# echo "Installer-script generated: $installer_script"