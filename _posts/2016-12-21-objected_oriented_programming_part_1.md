---
layout: post
title: "Objected-oriented Programming, Part 1"
date: "2016-12-21"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
        <div dir="ltr" style="text-align: left;" trbidi="on">
          <div dir="ltr" style="text-align: left;" trbidi="on">
            <div dir="ltr" style="text-align: left;" trbidi="on">
              <div dir="ltr" style="text-align: left;" trbidi="on">
                <div dir="ltr" style="text-align: left;" trbidi="on">I am working on my first text-adventure game as part of <a href="https://learnrubythehardway.org/book/ex43.html" target="_blank">Exercise 43 of Learn Ruby the Hard Way</a>.  I
                  have defined a simple class called Scene:<br><br>
</div>
                <pre class="brush:ruby gutter:false">class Scene<br>  def enter()<br>    puts "This scene is not yet configured. Subclass it and implement enter()."<br>    exit(1)<br>  end<br>end<br></pre>
<br>In other words, the only
                thing that "Scenes" have in common is that the player "enters" them.  What she does and whither she goes thereafter has to be defined.  <br><br>Within the game there are broadly speaking two kinds of scenes:<br>
                <ol style="text-align: left;">
                  <li>Scenes outside the house</li>
                  <li>Scenes inside the house</li>
                </ol>
                <h2 style="text-align: left;"><span style="font-weight: normal;">Scenes Outside the House</span></h2>
                <div class="separator" style="clear: both; text-align: center;"><a href="https://4.bp.blogspot.com/-qCGfGVhscMs/WFCxo1AgNXI/AAAAAAAALNU/29Ct34lGC9gKF9h2VcsvFF7ng2vYN0y-ACPcB/s1600/98816089_ebe4195dd2_b.jpg" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" height="240" src="https://4.bp.blogspot.com/-qCGfGVhscMs/WFCxo1AgNXI/AAAAAAAALNU/29Ct34lGC9gKF9h2VcsvFF7ng2vYN0y-ACPcB/s320/98816089_ebe4195dd2_b.jpg" width="320"></a></div>
                <div style="text-align: left;"><span style="font-weight: normal;">  </span></div>
                <div style="text-align: left;"><span style="font-weight: normal;">The very limited movements afforded at the start of the game serve to illustrate the point that not a lot of thought went into (or had to go into) defining how you
                    navigate the first part of the map. </span></div>
                <pre class="brush:plain gutter:false"> <br>Meadow =&gt; River<br>Meadow =&gt; Front door<br><br>River =&gt; Front door <br>Front door =&gt; riddle =&gt; Ground floor of the house.<br></pre>
                <div style="text-align: left;"></div>
                <h2 style="text-align: left;"><span style="font-weight: normal;">Scenes Inside the House</span></h2>
                <div style="text-align: left;"><span style="font-weight: normal;">This is where things get tricky.  All the rooms in the house are connected by a staircase, which means that when you leave one room, you have access to all the
                    others by means of the staircase.</span></div>
                <div style="text-align: left;"><br></div>
                <div style="text-align: left;">
<span style="font-weight: normal;">At first I defined the method for getting up the stairs from the ground floor entrance composed of the following elements:</span><br>
                  <ul style="text-align: left;">
                    <li><span style="font-weight: normal;">Text for the player</span></li>
                    <li><span style="font-weight: normal;">Declared value for floorNumber </span></li>
                    <li><span style="font-weight: normal;">While loop </span></li>
                    <li>
<span style="font-weight: normal;">Case conditional that calls the engine.</span><span style="font-weight: normal;"> </span>
</li>
                  </ul>
                </div>
              </div>
              <pre class="brush:ruby gutter:false">def enter()<br><br>"""<br>    You are at a spiral staircase.  There is a sign on the landing:<br><br>    0. Ground Floor: Entrance to the castle<br><br>    1. First Floor: Machine room<br><br>    2. Second Floor: Kitchen<br><br>    3. Third Floor: Library<br><br>    4. Fourth Floor: Royal Bedroom<br><br>    5. Penthouse: Study<br><br>    6. Exit the castle and go back to the meadow.<br><br>    Where would you like to go to?<br><br>    """<br>    currentFloor = 0<br>    while currentFloor == 0<br>      print "&gt; "<br><br>      floorSelection = $stdin.gets.chomp.downcase()<br><br>      case floorSelection<br>      when /0/, /ground/, /entrance/<br>        if currentFloor == 0<br>          puts "You are already here.  Try another floor."<br>        elsif currentFloor != 0<br>          puts "You descend the stairs to the ground floor."<br>          return 'spiral_staircase'<br>        else<br>          puts "Something has clearly gone wrong."<br>        end<br>      when /1/, /first/, /machine/<br>        if currentFloor &lt; 1<br>          puts "You ascend the stairs to the machine room."<br>          currentFloor == 1<br>          return 'machine_room'<br>        elsif currentFloor &gt; 1<br>          puts "You descend the stairs to the machine room."<br>          currentFloor == 1<br>          return 'machine_room'<br>        elsif currentFloor == 1<br>        puts "You are already here.  Try another floor."<br>        else<br>          puts "There has clearly been a mistake somewhere."<br>        end<br>      when /2/, /second/, /kitchen/<br>        if currentFloor &lt; 2<br>          puts "You ascend the stairs to the kitchen."<br>          currentFloor == 2<br>          return 'kitchen'<br>        elsif currentFloor &gt; 2<br>          puts "You descend the stairs to the kitchen."<br>          currentFloor == 2<br>          return 'kitchen'<br>        elsif currentFloor == 2<br>        puts "You are already here.  Try another floor."<br>        else<br>          puts "There has clearly been a mistake somewhere."<br>        end<br>      when /3/, /third/, /library/<br>        if currentFloor &lt; 3<br>          puts "You ascend the stairs to the library."<br>          currentFloor == 3<br>          return 'library'<br>        elsif currentFloor &gt; 3<br>          puts "You descend the stairs to the library."<br>          currentFloor == 3<br>          return 'library'<br>        elsif currentFloor == 3<br>        puts "You are already here.  Try another floor."<br>        else<br>          puts "There has clearly been a mistake somewhere."<br>        end<br>      when /4/, /fourth/, /bedroom/<br>        if currentFloor &lt; 4<br>          puts "You ascend the stairs to the bedroom."<br>          currentFloor == 4<br>          return 'bedroom'<br>        elsif currentFloor &gt; 4<br>          puts "You descend the stairs to the bedroom."<br>          currentFloor == 4<br>          return 'bedroom'<br>        elsif currentFloor == 4<br>        puts "You are already here.  Try another floor."<br>        else<br>          puts "There has clearly been a mistake somewhere."<br>        end<br>      when /5/, /fifth/, /study/, /penthouse/<br>        if currentFloor &lt; 5<br>          puts "You ascend the stairs to the study."<br>          currentFloor == 5<br>          return 'study'<br>        elsif currentFloor &gt; 5<br>          puts "You descend the stairs to the study."<br>          currentFloor == 5<br>          return 'study'<br>        elsif currentFloor == 5<br>        puts "You are already here.  Try another floor."<br>        else<br>          puts "There has clearly been a mistake somewhere."<br>        end<br>      when /6/, /leave/, /exit/, /back/, /meadow/<br>        if currentFloor != 0<br>          puts WordWrap.ww "You descend the stairs, walk out the door, and keep going until the you reach the edge of the meadow."<br>          currentFloor == 0<br>          return 'meadow'<br>        elsif currentFloor == 0<br>          puts "You walk out the door, and keep going until the you reach the edge of the meadow."<br>          return 'meadow'<br>        else<br>          puts "There has clearly been a mistake somewhere."<br>        end<br>      else<br>        puts "I don't understand your request"<br>      end<br><br>    end<br>end<br></pre>
<br>But
              copy-pasting all of this would violate the <a href="http://infogalactic.com/info/Don%27t_repeat_yourself" target="_blank">DRY principle</a>, so I thought about how to write it better:<br>
              <ul style="text-align: left;">
                <li>All 'Scenes' use the enter() function.</li>
                <li>All the rooms are 'Scenes'.</li>
                <li>All the rooms are 'Scenes' that require the same function for selecting a floor.</li>
                <li>Ergo, all the rooms are 'Scenes' use a function that could be defined as 'selectFloor()'.</li>
                <li>However, every room is located on a particular floor, which changes whether the player goes up or down the stairs, or is already at that floor.</li>
                <li>Ergo, every 'House Scene' needs to inherit the function 'selectFloor()' but with a variable for its floor, i.e. 'selectFloor(floorNumber)'</li>
              </ul> First, I created a sub-class of 'Scene' called 'HouseScene':<br>
            </div>
            <pre class="brush:ruby gutter:false">class HouseScene &lt; Scene<br><br>  def floorSelection()<br>    puts "This scene is not yet configured.  Subclass it and implement floorSelection()."<br>    exit(1)<br>  end<br><br>end<br><br></pre>
          </div>
<br>But remember that the floorSelection function is a while loop, so it needs a constant to hold true while it runs.  The obvious candidate is the floor number, so the function takes an argument and starts like this:<br>
        </div>
        <pre class="brush:ruby gutter:false">  def floorSelection(floorNumber)<br>    puts "Filler text for the moment"<br>    currentFloor = floorNumber<br>    while currentFloor == floorNumber<br><br></pre>
<br>From there it's simply a
        matter of pasting the rest of the floorSelection(floorNumber) function into the sub-class 'HouseScene'.<br><br>Then, for each room, call the functions:<br>
        <ul style="text-align: left;">
          <li>enter()</li>
          <li>floorSelection()</li>
        </ul>If the player leaves the room, she will go back to the landing of the staircase and choose again whither she wants to go.<br><br>This slightly more complex code brings me finally to the point where testing my program becomes a
        drag.  Until now, I could effortlessly run a straightforward program from start to finish; now, I have many potential routes to follow, and testing them all will take exponentially more time as I add games and puzzles to each room.<br><br>In
        my next post I will share my first experience of testing and Rake files in Ruby.
      </div>