# WinDotFiles

## What this is
Unfortunately, I use a Windows system for both my dev work and day-to-day use. That's not to say Windows isn't a good operating system, it's just that it's much less customizable than Linux systems, and in my opinion find it better for development. (I speak from experience, I have used Manjaro Linux before)

This repo contains all the configuration files I use to customize my Windows Powershell prompt as best as I can.

## Can I use it?
Of course! One of the main reasons I put this on Github is so that other people can take my config, adjust it to their liking, and have their own awesome shells as well!

## Setting up
To set up, you do need some prerequisites. They are:

- [Starship](https://starship.rs/)
- Git
- [HTTPie](https://httpie.io/cli)

These are absolutely necessary for it to work. The others are optional, as they aren't required for the config itself, but these are the languages/tools I use and what this config is specified for. Those are:

- Javascript/NodeJS
- Golang
- Python 3x
- Java

Once you have the required stuff set up, first, we need to edit our Starship configuration. To do this, first, verify your Starship and Git installs. To do this, open your terminal and run the following commands:
```bash 
starship -V
git --version
```
If these commands fail, please check your starship and git installs depending on which command failed.

Once you have these properly set up, run the command:
```bash
starship config
```
this should open up a file in your default text editor, which may be Notepad or a different application.

If this fails to open any files, it may be because you don't have a configuration file created. Try the following commands:
```bash
mkdir -p ~/.config
New-Item ~/.config/starship.toml
```

Then, copy the code inside `starship.toml` and paste it into your config file.

Now that we have the starship config done, you might not see anything yet. This is because we havent told starship to use that config and start doing its magic yet! To do that, we need to edit something called the Powershell Profile. What this is, is basically some code that runs every time you launch your powershell session. If your a linux user, this is similar to the `.bashrc` file.

Go back to your terminal, and run the following command:
```bash
notepad $PROFILE
```
The $PROFILE stands for the path to your profile, and the command opens it in notepad.

Into the file, paste all the stuff inside `WindowsProfile.ps1`, and just like that, its done!
Restart your terminal and you should see your brand new customized terminal in all its glory!