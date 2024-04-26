﻿# Basic Setup Guide

Before doing anything be sure to enable clipboard history, this can be done with ``window key + v``

## Setting up the terminal

- Download the latest version of termial via the MS store
- Download the latest version of VS Code via the MS store
- Insure that it is set as defualt and running powershell
- Make sure winget is enabled by running ``winget``

Now with the actual setup of oh-my-posh and some of the other tweaks

First grab a nerd font, a good source is [nerdfonts.com](https://www.nerdfonts.com/)
I usually use FiraCode
Simply install the font like you would install most fonts

Next find a theme I use this tool [windows terminal theme](https://windowsterminalthemes.dev/)
To add a theme simply open up the settings then click on the **Open JSON file**
Then just scroll all the way down to schemes and add the copied JSON text

Next head to the Defualts > Apperance and complete the following

- Set the color scheme to the one you just added (I use Arthur)
- Set the font face to whatever font you downloaded

## Execution Policy

Before we do anything with powershell we need to setup the exectuion policy
This will allow us to run scripts which is kinda required for oh-my-posh

First to check the current policy run the following command

``` jack
Get-ExecutionPolicy -List
```

Usually this is a easy enough fix by running the terminal in admin and changing a config
Sadly, due to the device polices we cant do this and will instead have to run if for the local user...

Luckily this is pretty easy by running the following command

``` jack
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```

It dosen't actually give us a response, but you can run the get command to make sure it worked
If done correctly CurrentUser should have its policy defined as Bypass

## Setting up oh-my-posh

Now lets get to work with oh-my-posh, basically follow the guide found on the [site](https://ohmyposh.dev/docs/installation/windows) for the most part

First download oh-my-posh on the terminal via winget

``` jack
winget install JanDeDobbeleer.OhMyPosh -s winget
```

Next reoload the terminal and run

``` jack
oh-my-posh
```

For any issues just check the offical website as linked above

Next you will want create a powershell profile
This is where you will be able to setup the settings / config for powershell
Run the following commands to create and open these files

``` jack
New-Item -Path $PROFILE -Type File -Force
```

``` jack
notepad $PROFILE
```

Now that you have the file open simple paste the following into the document

``` ps1
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/[Theme Title].omp.json" | Invoke-Expression
cls
```

Be sure to change the theme title the theme you wish to use, you can check what themes are avaliable by either running the command ``Get-PoshThemes`` or if its not currently working you can check out the [site](https://ohmyposh.dev/docs/themes)
cls is also optional, I just find it makes it look cleaner
I often use a slightly modified version of ``emodipt-extend``

## Get Git

Kinda funny, I know.

Since we cant (as far as I know simply run the git installer) we will use the easiest way to bypass **WINGET**
Simply run the following command and then done, you have git installed

``` jack
winget install --id Git.Git -e --source winget
```

Next we need too update the config of git allowing us too actual push files
I like to append the room name / ID atleast when setting this up at school

``` jack
git config --global user.name "[name] [room]"
git config --global user.email "[email]"
```

## Set VS Code Font

Head to the settings and search for ``Editor Font Family``
And paste the following

```jack
Consolas, 'Courier New', monospace, 'FiraCode Nerd Font'
```

And that pretty much covers all of it
