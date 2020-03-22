---
layout: post
title:  Why I Do Not Want To Use A Graphical IDE
date:   Sat 21 Mar 19:04:46 AEDT 2020
tags: [coding, workflow, ide, terminal, shell]
---

## Summary

1. I want to have the greatest *practicable* freedom in my work environment.
2. Every graphical IDE demands an unsatisfactory compromise.
3. Knowledge of VIM keybindings is a powerful, highly portable asset.
4. Working in a text-based environment puts me in a state of [flow](https://www.youtube.com/watch?v=fXIeFJCqsPs)
5. Working in a text-based environment spurs me to deepen my knowledge of core CLI applications and patterns, e.g. Git, regular expressions, `bash`, `sed`.

# Once Upon A Time...

... when all I knew could be summarised in a few shell and Python scripts, I used [Gedit](https://wiki.gnome.org/Apps/Gedit) with a couple of plugins for bracket completion and snippets, which made it feel luxurious.  I had only the vaguest notion of something called an "IDE", but I couldn't conceive of why you'd need anything more than a text editor with bracket completion and syntax highlighting.

When I decided to become a software developer, I looked at a few options, and went with Atom for the same reasons that everyone does -- it's pretty, *seems* lightweight, and has loads of plugins.

Since then, I have probably spent almost 2,000 hours in Atom.

## It's OK To Use A Graphical IDE

Besides Atom, I have also racked up a fair few hours in IntelliJ's editors Rubymine and IDEA, and have dabbled with Sublime and VSCode.  They are all very good editors and if you can get work done in any of them -- or any other -- then be my guest.

Working in a text-based IDE like VIM (with plugins) is certainly not for everyone, and if you work in Java, for example, you should stick with Eclipse or IDEA.

## I Want To Be Free

### The Ultimate Test Machine

A few years ago, I did a short course in video editing, in which the lecturor, who owned and operating a video production business, told us that he had a special VHS machine.  This VHS machine was old, clunky, and extremely unreliable, which is precisely why he tested video cassettes on it when he wanted to make sure there was not single thing wrong with them.

It was the sort of rubbish machine that would stop working if you cut the slightest corner, and thus, in its own way, it meant that he could say with absolute confidence that if his tape played in that machine, it would play in any machine under the sun.

### My Under-powered Touchstone

I too have such a device, which I use as my worklow touchstone: an **HP Stream 11.6" Laptop Celeron**, with 2GB of RAM, a Celeron CPU, and a 32GB SD card for a hard drive.  The machine's processor is so weak that its battery lasts for days, and if I have more than three tabs open in my browser the whole machine locks up.

I installed Ubuntu with LXDE on it, so although it is pretty light, the operating system could be lighter still, e.g. replacing the desktop environment with a tiling window manager like [i3](https://i3wm.org).

Nevertheless, even with a pretty light setup, `atom` routinely freezes even though a lot of plugins like the linter are disabled, and even [Spacemacs](https://www.spacemacs.org) is slow.

So, as a matter of principle -- and who knows? perhaps a future matter practicality -- I want a fully featured IDE that can remain **unobtrusively** fast no matter how weak my hardware.  Only then shall I be free to write and code on the barest hardware and operating system essentials.


