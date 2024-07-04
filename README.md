# TrollMe.sh 🧌

Welcome to TrollMe.sh, a fun and harmless way to play some jokes on your friends (because I know your family doesn't use the shell) when they leave their computer unattended. 

## What is TrollMe.sh?

TrollMe.sh is a website that allows you to install friendly and removable scripts on your friends' computers. These scripts perform amusing actions to surprise them. Simply run the following command on their terminal:

```sh
curl -s https://get.trollme.sh | sh -s -- "A friend"
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
curl -s https://get.trollme.sh | sh -s -- "A friend"
```

## Removal

Don't worry, everything is easy to remove. The script comes with an uninstall script that will clean up all the installed joke scripts.

```sh
~/.local/share/trollme.sh/uninstall.sh
```

## Support

If you enjoy TrollMe.sh and want to support the project there are several ways.

* Use it with friends :)
* Like it
* Write additional scripts
* <a href="https://www.buymeacoffee.com/bottiger"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=bottiger&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff"></a>

## Disclaimer

This project is intended for fun and harmless jokes. Always ensure you have permission to run scripts on someone else's computer.