---
layout: post
title: "JavaScript Game: Don't Poo Your Pants "
date: "2016-11-24"
author: "Alexander Garber"
tags: [ javascript, code ]
---

  ``` 
  var user = prompt( "You walk into a hotel wearing a 100% polyester leisure suit.  You need to go the toilet.  Do you ENTER the toilet, WAIT in the lobby, or EXIT to the street?" ).toUpperCase();

switch ( user ) {
case 'ENTER':
  console.log( "Excellent! You enter the toilet." );

  var enter = prompt( "Your bowels start to rumble uncontrollably.  Do you see an EMPTY stall or a BROKEN toilet?" ).toUpperCase();

  if ( enter === "EMPTY" || enter === "BROKEN" ) {
    console.log( "Well done! You might have created a mess for someone else, but at least you did not poo your pants." );
  } else {
    console.log( "Oh no! Your beautiful 100% polyester suit has been ruined.  Now you'll never get laid, Larry." );
  }
  break;

case 'WAIT':
  console.log( "Oh no! Your bowels are rumbling." );
  var wait = prompt( "You threw away your only chance to get to a toilet.  As your bowels rumble uncontrollably, do you allow yourself to HOLD your breath and FAINT and poo your pants whilst unconscious or HUMILIATE yourself in full knowledge of your crime?" );
  if ( wait.indexOf( "HOLD" ) >= 0 && wait.indexOf( "FAINT" ) >= 0 ) {
    console.log( "As you drift away, you become blissfully ignorant of the mess, stench, and humiliation." );
  } else {
    console.log( "As you perform one of the most humiliating acts known to Man, you ponder whether you should not have, instead, gone to the toilet a few steps away." );
  }
  break;
case 'EXIT':
  console.log( "You have left the only place with an accessible toilet.  You will poo your pants, my friend." );
  break;
default:
  console.log( "That made no sense.  Try again." );
}
```