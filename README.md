# TrollMe.sh 🧌

Welcome to [TrollMe.sh](https://trollme.sh), a fun and harmless way to play some jokes on your friends (because I know your family doesn't use the shell) when they leave their computer unattended. 

## What is TrollMe.sh?

[TrollMe.sh](https://trollme.sh) is a website and a script that aims to be the fastest way to install friendly but annoying scripts on your friends' computers. These scripts perform amusing actions to surprise them. Simply run the following command on their terminal:

```sh
curl -s https://get.trollme.sh | sh -s -- "A friend"
```

## What Does It Do?

The script installs a variety of harmless joke scripts on the computer.
Here are a few examples:

- **Messing with Bash Aliases**: Change common commands to do unexpected things.
- **Sudo Denial**: Display a message like "I’m sorry $USER, I’m afraid I can’t do that" instead of allowing the user to execute commands with sudo.
- **Strange Sounds**: Play odd sounds randomly in the background.
- **Fake Login Prompt**: Present a fake login prompt when opening a new terminal window.

## Implementation

## Adding Your Own Scripts

It's easy to add more jokes. Just write a small script and commit it to the `shellscripts/actions` folder. This keeps the fun going and allows for a variety of jokes.

## Installation with Identification

When installing the script, include your name to identify yourself. This adds to the fun and assures your friend that their computer has not been compromised. Here’s how you can do it:

```sh
curl -s https://get.trollme.sh | sh -s -- "A friend"
```

## Troll.sh

The main script is called `troll.sh` and located in `~/.local/share/troll.sh/`. 
The script will be executed every time a new shell is opened and maybe execute one of the troll-scripts. If it does it will select a valid script at random and run it.

Whether a script is considered valid depends on how long `troll.sh` has been installed on the victims computer. Each troll-script is prefixed by a number which defines after how many days it will become active. Scripts starting with `00_` will be active from day 1 and scripts starting with `05_` will be dormant untill the installation is 5 days old.

Scripts which are active from day one should be more subtle than scripts which are activated later on.

### Debugging

You can enable debugging output from `troll.sh` by setting the environment variable `TROLLMESH_DEBUG=true`

## Removal

Don't worry, everything is easy to remove. The script comes with an uninstall script that will clean up all the installed joke scripts.

```sh
~/.local/share/trollme.sh/uninstall.sh
```

### Manual removal

If you want or need to remove it manually you can just follow these two simple steps

1. Delete the marked code snippet from your `.bashrc`, `.zshrc`, `.config/fish/config.fish` (or whatever file your shell uses)
2. Delete the folder `~/.local/share/trollme.sh/`

Nothing else is added to your computer during the installation or execution

## Support

If you enjoy TrollMe.sh and want to support the project there are several ways.

* Use it with friends :)
* Like it
* Write additional scripts
* <a href="https://www.buymeacoffee.com/bottiger"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=bottiger&button_colour=FFDD00&font_colour=000000&font_family=Cookie&outline_colour=000000&coffee_colour=ffffff"></a>

## Disclaimer

This project is intended for fun and harmless jokes. Always ensure you have permission to run scripts on someone else's computer.