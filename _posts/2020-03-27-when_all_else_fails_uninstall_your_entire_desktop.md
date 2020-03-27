---
layout: post
title:  When All Else Fails, Uninstall Your Entire Desktop
date:   Fri 27 Mar 21:36:17 AEDT 2020
tags: [linux, apt, packages]
---
I was trying to install the dependencies for [mutt-wizard](https://github.com/LukeSmithxyz/mutt-wizard), but apt simply refused to install `isync`:

```sh

Some packages could not be installed. This may mean that you have
requested an impossible situation or if you are using the unstable
distribution that some required packages have not yet been created
or been moved out of Incoming.
The following information may help to resolve the situation:

The following packages have unmet dependencies:
 ca-certificates-java : Depends: ca-certificates (>= 20121114) but it is not going to be installed
 isync : Depends: libssl1.1 (>= 1.1.0) but it is not going to be installed
E: Error, pkgProblemResolver::Resolve generated breaks, this may be caused by held packages.


```

I followed [all the usual steps](https://appuals.com/fix-unmet-dependencies-error-ubuntu/) to no avail.

I forcibly downgraded `libssl1.1` to an older version, and inadvertantly uninstalled the entire Ubuntu desktop.

I then reinstalled `ubuntu-desktop`, and lo and behold: I could now install `isync`.

I was briefly tempted to leave my machine without a desktop environment and finally make the switch to the [i3 tiling window manager](https://i3wm.org/), but that will have to be a project for another day.
