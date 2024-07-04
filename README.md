# TrollMe.sh 🧌

Welcome to TrollMe.sh, a fun and harmless way to play some jokes on your friends (because I know your family doesn't use the shell) when they leave their computer unattended. 

## What is TrollMe.sh?

TrollMe.sh is a website that allows you to install friendly and removable scripts on your friends' computers. These scripts perform amusing actions to surprise them. Simply run the following command on their terminal:

```sh
curl -s https://get.trollme.sh | sh -s -- "An unknown friend"
```

## What Does It Do?

The script installs a variety of harmless joke scripts on the computer. Here are a few examples:

- **Messing with Bash Aliases**: Change common commands to do unexpected things.
- **Sudo Denial**: Display a message like "I’m sorry $USER, I’m afraid I can’t do that" instead of allowing the user to execute commands with sudo.
- **Strange Sounds**: Play odd sounds randomly in the background.
- **Fake Login Prompt**: Present a fake login prompt when opening a new terminal window.

## Adding Your Own Scripts

It's easy to add more jokes. Just write a small script and commit it to the `shellscripts/actions` folder. This keeps the fun going and allows for a variety of jokes.

## Installation with Identification

When installing the script, include your name to identify yourself. This adds to the fun and assures your friend that their computer has not been compromised. Here’s how you can do it:

```sh
curl -s https://get.trollme.sh | sh -s -- "An unknown friend"
```

## Removal

Don't worry, everything is easy to remove. The script comes with an uninstall script that will clean up all the installed joke scripts.

## Support

If you enjoy TrollMe.sh and want to support the project, you can do so on GitHub Sponsor. Your support is greatly appreciated!

## Disclaimer

This project is intended for fun and harmless jokes. Always ensure you have permission to run scripts on someone else's computer.