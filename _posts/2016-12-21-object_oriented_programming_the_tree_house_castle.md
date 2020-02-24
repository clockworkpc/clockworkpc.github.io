---
layout: post
title: "Object Oriented Programming: The Tree House Castle"
date: "2016-12-21"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
        <div dir="ltr" style="text-align: left;" trbidi="on">
          <h2 style="text-align: left;">Learn Ruby the Hard Way: Exercise 43</h2>
          <div>From the book:<br>
            <blockquote class="tr_bq">I’m going to describe a process to use when you want to build something using Ruby, specifically with object-oriented programming (OOP). What I mean by a ”process” is that I’ll give you a set of steps that you
              do in order, but that you aren’t meant to be a slave to or that will totally always work for every problem. They are just a good starting point for many programming problems and shouldn’t be considered the only way to solve these types
              of problems. This process is just one way to do it that you can follow.<br>The process is as follows: </blockquote>
            <blockquote class="tr_bq">1. Write or draw about the problem.<br>2. Extract key concepts from 1 and research them.<br>3. Create a class hierarchy and object map for the concepts.<br>4. Code the classes and a test to run them.<br>5.
              Repeat and refine.</blockquote>
          </div>
          <div style="text-align: left;">
            <h2 style="text-align: left;">Step One: Write about the Problem</h2>
            <div>
              <h3 style="text-align: left;">A Fairy Tale About a Tree House, A Prince, and a Princess</h3>
              <div>
                <blockquote class="tr_bq">The Tree Castle / A.J. Garber<br><a href="https://4.bp.blogspot.com/-qCGfGVhscMs/WFCxo1AgNXI/AAAAAAAALNU/29Ct34lGC9gKF9h2VcsvFF7ng2vYN0y-ACPcB/s1600/98816089_ebe4195dd2_b.jpg" imageanchor="1" style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"><img border="0" height="240" src="https://4.bp.blogspot.com/-qCGfGVhscMs/WFCxo1AgNXI/AAAAAAAALNU/29Ct34lGC9gKF9h2VcsvFF7ng2vYN0y-ACPcB/s320/98816089_ebe4195dd2_b.jpg" width="320"></a>Once upon a time there was a wandering prince
                  who had no castle to call his home.  To be fair, he was not the son of a king, nor an heir to a throne, but this did not altogether rule out his royal ambitions, although it did put something of a damper on them.<br>He wore
                  as a pendant an emerald ring made of silver, which bore the inscription 'Mano Karalienė'.  He didn't usually care much for pretty things, but he felt he might need it one day. </blockquote>
                <blockquote class="tr_bq">At any rate, he had found a plot of land in the middle of a meadow, not far from a river, and a strong pair of hands, patience, and time.  He felled trees, cut timber, planted studs, built up walls, and
                  eventually put together for himself a rudimentary castle.  Well, maybe not a castle per se, more of a house, a hovel, if you will -- but still better than sleeping without a roof over one's head! </blockquote>
                <blockquote class="tr_bq">It had a door and a rough hole that could be covered when it rained, and that was better than nothing, and after all, one has to start somewhere, right?<br>The river flowed, the moons waxed and waned, and
                  the hopeful prince's castle-in-the-making grew and branched out.  And by 'branched out' I mean the prince accidentally dropped a magical seed on the dirt floor and spilled some tea on it a few days later. </blockquote>
                <blockquote class="tr_bq">Within a few days, a large tree sprang up, broke through the thatched roof, and branched out over the house, like a rather uninvited garden umbrella.<br>Not to be discouraged, the prince used the
                  heretofore unforeseen central column as a scaffold for various extensions to his castle-in-the-making.  He had always wanted to build up from the ground floor, and a rapidly growing, sturdy tree in what had been his living
                  room gave him exactly what he needed to work with.  As the tree grew taller and wider, the flexibly defined castle-in-the-making grew up and out around it. </blockquote>
                <blockquote class="tr_bq">It should come as no surprise that the prince became thoroughly absorbed in the ever on-going construction of his castle-in-the-making.  There was always another room to build, another branch to work an
                  extension from, some improvement that could be made somewhere.  And, to be fair, the humble shack grew into a most impressive albeit unorthodox dwelling. </blockquote>
                <blockquote class="tr_bq">And yet, the prince felt keenly the want of something in his abode.<br>Fortifications? Underway.<br>Decorations? Unnecessary.<br>A kingdom to rule over? Perhaps, although who was to say the prince's
                  domain was insufficient in and of itself?<br>He was fond of his patch in the meadow by the river, and had a castle-in-the-making to defend it from... But no-one to rule over it with.  That was problem. </blockquote>
                <blockquote class="tr_bq">'A prince needs a princess as a house needs a tree,' he decided and went to the highest room amidst the upper-most branches to ponder the matter.  He ought to find himself a princess, he reasoned.
                   Not the sort of princess accompanied by handmaids and livery that attracted knights in shining armour as suitors: such a princess would not appreciate the irregularity of his castle-in-the-making, or the paucity of furniture,
                  or the animals that sometimes invited themselves in.  Also, aristocratic accessories such as horses and armour cost a fortune, and he preferred getting about on his own two feet with a simple knapsack thank-you-very-much.
                   But then again, princesses seemed to go in for things that glitter, shine, glisten, prance and neigh.  What if there were a princess who preferred sitting on a tree branch on a sunny day, enjoying a gentle breeze and
                  sunlight speckled through the leaves?  There wasn't anything better than that, except perhaps taking an afternoon nap on his large sleeping cushion with the sunlight on his back.  Surely there was a princess out there who
                  could appreciate that. </blockquote>
                <blockquote class="tr_bq">As the prince contemplated his solitary reign, a beautiful young princess crossed the meadow and came up to his castle-in-the-making.  She had long dark braids and perfect almond chestnut eyes.
                   She had no livery or handmaids, but was proud of a stout leather backpack and a durable pair of waterproof boots that she could even wade through a shallow stream in without getting her feet wet. </blockquote>
                <blockquote class="tr_bq">'This must be the most ridiculous tree-house I have ever seen,' she said to herself as she looked up at the hodge-podge of rooms leaning out like drunkards from the trunk.  'It does look like a fun
                  place to live in, though.' </blockquote>
                <blockquote class="tr_bq">The princess knocked on the front door, but the prince was lost in thought at the top of the arboresque tower.  The princess entered and ascended the spiral staircase around the trunk.  She was
                  alternately delighted and dismayed, amused and bemused by the eclectic, haphazard arrangements; as she explored, she divined the intimate relationship of the builder to his environment and wondered to herself what sort of
                  idiosyncrasy was composed of creativity, recklessness, attentiveness, and absentmindedness in such large doses.  She reasoned that, if nothing else, the creator of this place -- whatever it was -- had passion and energy. </blockquote>
                <blockquote class="tr_bq">She found what seemed a bedroom without a bed, and weary from her exploration, curled up on a large floor cushion.  The afternoon sunlight, filtered by the leaves outside the window, provided a gentle
                  sheet of warmth to her back, and the princess quickly fell asleep. </blockquote>
                <blockquote class="tr_bq">The prince entered the bedroom distracted by his day's unfruitful ponderings and nearly fell over when he saw the princess on his cushion.  After some hesitation he sat down on the floor before her and
                  watched her softly parted lips and admired her fair cheeks.  She snored gently, in the most fetching way, and drooled slightly on his cushion.  He took out a handkerchief and wiped the cushion -- it was no bother, he
                  didn't mind at all. </blockquote>
                <blockquote class="tr_bq">The prince grew relaxed and then sleepy, and stretched out on the floor.<br>Some time later, the princess awoke to see a beautiful man on the floor beside her.  His fingers were blotched with ink, and
                  there were leaves in his curly hair which cascaded across his eyes and glittered in the late afternoon sunlight.  She admired his handsome, glowing, freckled face and knelt down to look at him more closely.  Then she lay
                  down next to him, face to face, and put her hands in his. </blockquote>
                <blockquote class="tr_bq">The following morning, they opened their eyes to each other.<br>'Art thou an angel?' He asked her.<br>'Nay, a princess.  Art thou thyself an angel?'<br>'Nay, but a prince.'<br>'Is this thy
                  castle?'<br>'A castle-in-the-making.'<br>'It pleaseth me.'<br>They fell silent.<br>The prince reached remembered his emerald ring pendant, and showed it to her.  'I think this ring should belong to thee.'<br>The
                  princess read the inscription and smiled.  'Yes, I am.'<br>He placed the ring on her finger.<br>'We are not, then, in a dream?' He ventured.<br>'A dream come true, methinks.' She replied.<br>'If that be so, then thou
                  art my queen.'<br>'And thou in that case art my king.'<br>And the queen placed her lips on his, and sealed their marriage with a kiss.</blockquote>
              </div>
              <h2 style="text-align: left;">Step Two: Extract Key Concepts and Research Them</h2>
            </div>
            <div>
              <h3>Nouns</h3>
            </div>
            <div>Princess (You)</div>
            <div>Meadow</div>
            <div>River</div>
            <div>Tree house castle</div>
            <div>Front door</div>
            <div>Riddle</div>
            <div>Door lock</div>
            <div>Entrance</div>
            <div>Spiral staircase</div>
            <div>Machine room</div>
            <div>Kitchen</div>
            <div>Linux sandwich maker</div>
            <div>Sandwich</div>
            <div>Library</div>
            <div>Talking books</div>
            <div>Bedroom</div>
            <div>Floor cushion</div>
            <div>Prince</div>
            <div>Conversation (acquaintence)</div>
            <div>Ring</div>
            <div>Inscription</div>
            <div>Translation</div>
            <div>Conversation (engagement)</div>
            <div>Conclusion (marriage)</div>
            <h3 style="text-align: left;">Verbs</h3>
            <div>Go, Walk (river, tree house castle)</div>
            <div>Drink water (river)</div>
            <div>Cross (river)</div>
            <div>Knock (front door)</div>
            <div>Read (riddle)</div>
            <div>Unlock (front door)</div>
            <div>Enter (entrance, machine room, kitchen, library, bedroom)</div>
            <div>Exit (entrance, machine room, etc.)</div>
            <div>Ascend (spiral staircase)</div>
            <div>Pick up (gadget, talking book, etc.)</div>
            <div>Look at (gadget, talking book, etc.)</div>
            <div>Lie down (floor cushion, floor)</div>
            <div>Translate (inscription)</div>
            <div>Kiss (prince)</div>
            <h3 style="text-align: left;">Status</h3>
            <div>Prince in the room (bedroom)</div>
            <div>Prince not in the room (bedroom)</div>
            <div><br></div>
            <h2 style="text-align: left;">Step Three: Create a Class Hierarchy and Object Map for the Concepts</h2>
            <h3 style="text-align: left;">Create a Class Hierarchy</h3>
            <div>
<br>
              <div>Map</div>
              <div>  - next_scene</div>
              <div>  - opening_scene</div>
              <div>Engine</div>
              <div>  - play</div>
              <div>Scene</div>
              <div>  - enter_scene</div>
              <div>  - exit_scene</div>
              <div>* Meadow</div>
              <div>* River bank</div>
              <div>* Entrance</div>
              <div>* Spiral staircase</div>
              <div>* Machine room</div>
              <div>* Kitchen</div>
              <div>* Library</div>
              <div>* Bedroom</div>
            </div>
            <h3 style="text-align: left;">Create an Object Map</h3>
            <div><br></div>
            <h2 style="text-align: left;">Step Four: Code the Classes and a Test To Run Them</h2>
            <div><br></div>
            <h2 style="text-align: left;">Step Five: Repeat and Refine</h2>
            <div><br></div>
          </div>
        </div>
      </div>