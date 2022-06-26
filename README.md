# Cheataroo - Project Zomboid

This is a mod I created for Project Zomboid with various 'cheat' items
and scripts, and as a tutorial on how to mod.

## Quickstart: Just use my mod

You need to have GIT installed and know how to use it.   Clone this repository
into a folder (I recommend renaming to 'cheataroo') where your Project Zomboid mods
go, for me it is `C:\Users\jason\Zomboid\mods`.  So three should be a file 
`C:\Users\jason\Zomboid\mods\cheataroo\mod.info`

In Steam, enable debug mode.   Right-click on the game, go to "Properties" and you
should see 'GENERAL'.   At the bottom is 'LAUNCH OPTIONS', add '-debug'.  (There are
some pages saying to edit the batch files in the game directory to pass `-Ddebug`
to the java command, but I don't think that's necessary)

Start the game.  There is a new 'cheater' profession (at the bottom of the list)
that starts you with most perks leveled up and 200 points to spend on traits, enough
to get all of them.

Also there is a script in `media/lua/shared/CheatHealth.lua` that keeps your
temperature perfect and cures your body parts about once a second.

The script `media/lua/shared/defines.lua` ***i think*** is used, and changes
settings so you won't get hungry, thirsty, tired, etc.   And it increases loot
modifiers.

There are also cheat items.   To access them, click the debug icon (bottom icon
on the left with a bug on it), make sure 'Main' is selected at the top, and click
on 'Items List'.  Type 'Cheat' in the 'Name' box at the bottom to filter on
the new items since I used 'Cheat' in their names.

There are cool and warm versions of most clothing that protect you completely
from wetness, bites, and scratches.  Except the 'groin' that is, I couldn't find
where a clothing slot could be used for the groin :(.  There are also cheat
versions of the shotgun and pistol that are silent, accurate, deadly, carry a lot
of ammo, and have a long range.  Also a nice cheat knife that in addition to
being a good melee weapon with a long range should let you perform a lot of
actions that you might need other tools for (farming, chopping down trees,
scissors, etc.)  You need to get some ammo (search '9mm' or 'shells') for the
pistol and shotgun.

# Creating a Mod

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

## Next: Look At The Game Files

In Steam, right-click on the game and go to 'Manage -> Browse local files'.  You
can see there is a 'mods' directory with an 'examplemod' directory underneath
that the developers were kind enough to include for reference.  I'm not sure that
it does anything or works.

The important thing is that you can see the same's actual data looking in the the
'media' folder.   I like to open this with VSCode and use the search functionality
to find things.  For example if you want to create a better knife, search for
'HuntingKnife'.

The way the game's files are used can teach you a lot.  I figured out how to add
a profession for instance just by searching for 'unemployed' and finding `lua/shared/NPCs/MainCreationMethods.lua`

## Notes - Various Things I've Found

### Icons

Item icons go in `media/textures` and are named `Item_XXXX.png`.  For example my
'CheatKnife' item in `media/scripts/items_cheatweapons.txt` has `Icon	=	CheatKnife,`.
The image for the icon is then `/media/textures/Item_CheatKnife.png`

Other Icons can just go in `media/textures` I think.   I had a hard time with the cheater
profession icon, but I just had to add `profession_cheater.png` and pass
`profession_cheater` when creating my profession.

It looks like textures for UI and things can get loaded like this:

```lua
o.adminIconOn = getTexture("media/ui/Admin_Icon_On.png");
```


### TexturePacks

Using [TileZed](https://www.dropbox.com/s/gpiib2ks6ebmrmh/TileZed%2BWorldEd-Apr-06-2021-64bit.zip?dl=0),
I can go to 'Pack Viewer' and open XXX/   There are entries (textures?) 'UI20' to 'UI29' and 'UI210' to
'UI212'.   Looking at 'UI21' I see the professions in the middle-right, one of them is
'profession_fireofficer2' which is the icon name used when creating that profession.  I think instead
of using a pack, it could be created as `media/textures/profession_fireofficer2.png`.  It doesn't
seem like adding this will override the texture pack though.


### Files are not overwritten

From what I've seen, the files you have in your mod do not actually overwrite
the games files as happens when modding many games.  For example if I just
add `/media/textures/Item_HuntingKnife.png` with a new icon for the hunting
knife, it doesn't actually affect the game.

I think the game just runs whatever 'lua' or 'txt' files are in the folders.
So i created an extra `lua/shared/Translate/EN/UI_EN.txt` file and

### Adding Gear

I *think* that you just need to create a '.txt' file in scripts.   I just copied items
from the game files and modified them to my liking.
