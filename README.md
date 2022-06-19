# Cheataroo - Project Zomboid

This is a mod I created for Project Zomboid with various 'cheat' items
and scripts, and as a tutorial on how to mod.

## Quickstart: Just use my mod

You need to have GIT installed and know how to use it.   Clone this repository
into a folder where your Project Zomboid mods go, for me it is 
`C:\Users\jason\Zomboid\mods`

## First Step: Create Mod Folder and `mod.info` file

> TLDR: Create a folder for your mod in `C:\Users\jason\Zomboid\mods\cheataroo`, replacing
'jason' with the the right name for your user on your computer.  You can find this in the
game by going to 'mods' from the main menu and looking where the example mod included with
the game is stored.  Create a `mod.info` file in that folder like this:

```
name=Cheataroo
poster=poster.png
id=cheatarooMod
description=Cheat stuff
url=https://github.com/JasonGoemaat/project-zomboid-cheataroo
```

I first created my mod in the game folder's 'mods' directory.   This worked, but I
found out that the game seems to just copy this to your user folder the first time it
sees it.  After that I had to edit the files in my user folder.

## Next: Check Out The Game Files

In Steam, right-click on the game and go to 'Manage -> Browse local files'.  You
can see there is a 'mods' directory with an 'examplemod' directory underneath
that the developers were kind enough to include for reference.  I'm not sure that
it does anything or works.

The important thing is that you can see the same's actual data looking in the the
'media' folder.   I like to open this with VSCode and use the search functionality
to find things.  For example if you want to create a better knife, search for
'HuntingKnife'.

## Notes - Various Things I've Found

### Icons

Item icons go in `media/textures` and are named `Item_XXXX.png`.  For example my
'CheatKnife' item in `media/scripts/items_cheatweapons.txt` has `Icon	=	CheatKnife,`.
The image for the icon is then `/media/textures/Item_CheatKnife.png`

I'm trying to get an icon for my new profession 'cheater'.   As an example, this is
what the fireman2 looks like compared to what mine looks like:

```lua
ProfessionFactory.addProfession("fireofficer", getText("UI_prof_fireoff"), "profession_fireofficer2", 0);
ProfessionFactory.addProfession("cheater", getText("UI_prof_cheater"), "profession_cheater", 180);
```

Using [TileZed](https://www.dropbox.com/s/gpiib2ks6ebmrmh/TileZed%2BWorldEd-Apr-06-2021-64bit.zip?dl=0),
I can go to 'Pack Viewer' and open XXX/   There are entries (textures?) 'UI20' to 'UI29' and 'UI210' to
'UI212'.   Looking at 'UI21' I see the professions in the middle-right, one of them is
'profession_fireofficer2'.

What I did was copy the game's 'media/ui/Admin_Icon_On.png' to my mod's 'media/textures/profession_cheater.png'.
The icon is used by the game in `lua/client/ISUI` with this:

```lua
o.adminIconOn = getTexture("media/ui/Admin_Icon_On.png");
```

This does not show up, so let's try moving it to `media/ui`...


### Files are not overwritten

From what I've seen, the files you have in your mod do not actually overwrite
the games files as happens when modding many games.  For example if I just
add `/media/textures/Item_HuntingKnife.png` with a new icon for the hunting
knife, it doesn't actually affect the game.

I think the game just runs whatever 'lua' or 'txt' files are in the folders.
So i created an extra `lua/shared/Translate/EN/UI_EN.txt` file and

### Adding Gear

I *think* that you just need to create a '.txt' file in scripts, the