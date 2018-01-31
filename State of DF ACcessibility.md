Per prompting from /u/themaskeddyer, I thought I'd make this post explaining where things stand with DF accessibility at the moment. It will hopefully be easier to process than the entire forum thread [here](http://www.bay12forums.com/smf/index.php?topic=145179.0).

* * * * *

# State of DF Accessibility #

## SDL VS. Text Mode ##

SDL, that is, the default way DF renders its interface, is completely inaccessible to modern screen readers. The program see an empty window, and are unable to read text or menus, let alone make meaningful progress with gameplay. This applies regardless of OS.

Linux and Mac, by contrast, offer a text-based mode for displaying DF in a terminal. This is the most accessible solution thus far, though it has its own quirks.

### Linux vs Mac Speech Synthesizers ###

The main distinction between Linux and Mac screen readers is the character sets they are capable of reading. This appears to depend on the speech synthesizer in use, among other things. In general, the Mac speech system reads all DF characters properly, while Linux fails to identify some of them. There is a cross-platform screen reader, [TDSR](https://github.com/tspivey/tdsr), which is promising, but at the moment does not have a way to obtain the color of a given character, which is essential for DF play.

### Blinking and Cursor Issues ###

Regardless of which screen reader I use, the tendency of DF to rapidly blink from one character to another makes navigating the screen, particularly when un-paused, very difficult. The screen readers see that a character has changed, and so insist on announcing the changed character. It can be enough to make me want to claw off my own ears, because it happens multiple times in quick succession. Toady One has indicated that this behavior is not simple to change, but it does seem to be made somewhat less annoying if I lower the frame rate drastically.

On a similar note, DF in tex mode doesn't really position the terminal cursor in a sensible location. This is how I tend to play more traditional rogue-like games, because the  screen reader can track the location of the terminal cursor, which is usually positioned over the player character at the start of each turn. This doesn't really apply as much in Fortress Mode, since the "selected," tile can be ambiguous, but it's a major obstacle to my enjoying the game at all, because I have no idea where I am from moment to moment.

### Other Screens ###

Surprisingly, many other DF screens are fairly easy to read with my screen readers. Legends Mode is almost perfect, and most of the dwarf management screens read reasonably well. The previous issues are the main stumbling blocks to my at least making an attempt at a basic fortress without becoming  totally confused.

## Current Accessibility Efforts ##

* DF Accessibility Utility: Downloadable [here](http://dffd.bay12games.com/file.php?id=11956). This allows the user to ask for information on the current tile, and bookmark tiles for future reference, among other things.

* DF Remote: I've been in touch with the author of the [DF Remote](http://mifki.com/df/setup/), about making his program more accessible. The map is currently not usable at all, but the rest of the app is fairly accessible using iOS's built-in screen reading technology.

* GameLog Reader: /u/lethosor wrote [this](https://raw.githubusercontent.com/lethosor/dfhack-scripts/master/acclog.lua), which I don't believe has been integrated into a DFFD package yet. It makes some menus output information about what's selected to a log file, which I can then read with a speech synthesizer. This helps in particular with the SDL print mode, from which i can't otherwise parse anything.

## Future Efforts ##

For the moment, I think DFHack is probably the best bet in terms of getting useful information out of the game and to my screen reading program. I'm curious what the developers of add-ons such as SoundSense and Dwarf Therapist might have to say, as their programs could also be useful models on which to work. Finally, I would love to find a way to enjoy the text-based DF more completely, as at the moment that experience isn't as pleasant as it could be.\n\nFor the longer term, some kind of alternative interface with sounds or speech cues would be an interesting experiment. I'm also very curious to know how much of DFRemote can be made fully accessible. Needless to say, I'm more than willing to test or provide feedback and ideas, though I'm afraid my own Lua programming skill is nil at the moment. Thanks for reading :)", 