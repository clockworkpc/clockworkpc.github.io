---
layout: post
title: "gets.chomp VS $stdin.gets.chomp"
date: "2016-12-02"
author: "Alexander Garber"
tags: [ruby, code]
---

<div dir="ltr" style="text-align: left;" trbidi="on">
  <div class="tr_bq">Whilst working on <a href="https://learnrubythehardway.org/book/ex15.html" target="_blank">Exercise 15 of Learn Ruby the Hard Way</a>, the author prompted me to ponder the difference between gets.chomp and $stdin.gets.chomp.<br /><br />The
    simplest explanation I found for the difference between gets.chomp and $stdin.gets.chomp is this, from <a href="https://stackoverflow.com/questions/10523536/whats-the-difference-between-gets-chomp-vs-stdin-gets-chomp#10523615" target="_blank">Stack
      Overflow</a>:</div>
  <pre class="brush:plain">gets.chomp() = read ARGV first<br /><br />STDIN.gets.chomp() = read user's input</pre>A further clarification:<br />
  <pre class="brush:plain">because if there is stuff in ARGV, the default gets method tries to treat the first one as a file and read from that. To read from the user's input (i.e., stdin) in such a situation, you have to use it STDIN.gets explicitly.</pre>
  <h3 style="text-align: left;">Source Code from <a href="https://learnrubythehardway.org/book/ex15.html" target="_blank">Exercise 15 of Learn Ruby the Hard Way</a>:</h3>
  <pre class="brush:ruby"><br /># Get the input file<br />filename = ARGV.first<br /><br /># Declare a variable to open the input file<br />txt = open(filename)<br /><br /># Output the contents of the input file<br />puts "Here's your file #{filename}"<br />print txt.read<br /><br /># Ask the user to name the input file, implicitly in the local directory<br />print "Type the filename again: "<br /><br /># Use stdin to obtain the name of the input file from the local directory<br />file_again = $stdin.gets.chomp<br /># file_again = gets.chomp<br /><br /># Declare another variable to open the input file again<br />txt_again = open(file_again)<br /><br /># Output the contents of the input file again<br />print txt_again.read<br /></pre>&nbsp;Take
  note that I put gets.chomp and $stdin.gets.chomp and uncommented the one I wanted to test.<br /><br />To this I added two text files for testing:<br />
  <ol style="text-align: left;">
    <li>ex_15_sample.txt</li>
    <li>ex_15_sample_2.txt</li>
  </ol>
  <div>
    <h3 style="text-align: left;">ex_15_sample.txt:</h3>
  </div>
  <div>
    <pre class="brush:plain">This is stuff I typed into a file.<br /><br />It is really cool stuff.<br /><br />Lots and lots of fun to have in here.</pre>
  </div>
  <div>
    <h3 style="text-align: left;">ex_15_sample_2.txt</h3>
  </div>
  <div>
    <pre class="brush:plain">THIS IS STUFF I TYPED INTO A FILE.<br /><br />IT IS REALLY COOL STUFF.<br /><br />LOTS AND LOTS OF FUN TO HAVE IN HERE.</pre>
  </div>
  <h2 style="text-align: left;">Scenario 1: $stdin.gets.chomp</h2>
  <div>
    <h3 style="text-align: left;">Script:</h3>
  </div>
  <pre class="brush:ruby"><br /># Get the input file<br />filename = ARGV.first<br /><br /># Declare a variable to open the input file<br />txt = open(filename)<br /><br /># Output the contents of the &nbsp;input file<br />puts "Here's your file #{filename}"<br />print txt.read<br /><br /># Ask the user to name the input file, implicitly in the local directory<br />print "Type the filename again: "<br /><br /># Use stdin to obtain the name of the input file from the local directory<br />file_again = $stdin.gets.chomp<br /># file_again = gets.chomp<br /><br /># Declare another variable to open the input file again<br />txt_again = open(file_again)<br /><br /># Output the contents of the input file again<br />print txt_again.read<br /><br /></pre>
  <div>
    <h3 style="text-align: left;">Command in terminal:</h3>
  </div>
  <pre class="brush:bash">$ ruby ex15.rb ex_15_sample.txt</pre>
  <div>
    <h3 style="text-align: left;">Output:</h3>
  </div>
  <div>
    <pre class="brush:plain">Here's your file ex_15_sample.txt<br /><br />This is stuff I typed into a file.<br /><br />It is really cool stuff.<br /><br />Lots and lots of fun to have in here.<br /><br />Type the filename again: <b>ex_15_sample_2.txt</b><br /><br />THIS IS STUFF I TYPED INTO A FILE.<br /><br />IT IS REALLY COOL STUFF.<br /><br />LOTS AND LOTS OF FUN TO HAVE IN HERE.</pre>
  </div>
  <h2 style="text-align: left;">Scenario 2: gets.chomp</h2>
  <div>
    <div>
      <h3 style="text-align: left;">Script:</h3>
    </div>
    <pre class="brush:ruby"># Get the input file<br /><br />filename = ARGV.first<br /><br /># Declare a variable to open the input file<br /><br />txt = open(filename)<br /><br /># Output the contents of the &nbsp;input file<br /><br />puts "Here's your file #{filename}"<br /><br />print txt.read<br /><br /># Ask the user to name the input file, implicitly in the local directory<br /><br />print "Type the filename again: "<br /><br /># Use stdin to obtain the name of the input file from the local directory<br /><br /># file_again = $stdin.gets.chomp<br /><br /><span style="color: red; font-weight: bold;">file_again = gets.chomp</span><br /><br /># Declare another variable to open the input file again<br /><br />txt_again = open(file_again)<br /><br /># Output the contents of the input file again<br /><br />print txt_again.read</pre>
    <div>
      <h3 style="text-align: left;">Command in terminal:</h3>
    </div>
    <pre class="brush:bash">$ ruby ex15.rb ex_15_sample.txt</pre>
  </div>
  <div>
    <h3 style="text-align: left;">Output:</h3>
  </div>
  <div>
    <pre class="brush:plain">Here's your file ex_15_sample.txt<br /><br />This is stuff I typed into a file.<br /><br />It is really cool stuff.<br /><br />Lots and lots of fun to have in here.<br /><br />Type the filename again: ex15.rb:20:in `initialize': No such file or directory @ rb_sysopen - <b><span style="color: red;">This is stuff I typed into a file. </span></b>(Errno::ENOENT)<br /><br /><span class="Apple-tab-span" style="white-space: pre;"> </span>from ex15.rb:20:in `open'<br /><br /><span class="Apple-tab-span" style="white-space: pre;"> </span>from ex15.rb:20:in `&lt;main&gt;'</pre>
  </div>
  <div>Let's look a little more closely at what went wrong. &nbsp;</div>
  <div><br /></div>
  <div>The first part of the script took the argument from the commandline and read the contents of the file ex_15_sample.txt -- great!</div>
  <div><br /></div>
  <div>Then it printed "Type the filename again." -- again, that's what we want.</div>
  <div><br /></div>
  <div>However, when it got to gets.chomp, it attempted to take as an input <b>the first line of the contents of the file</b> denoted by ARGV.</div>
  <div><br /></div>
  <div>Let's look at the contents of the text file in question:</div>
  <div>
    <div>
      <h3 style="text-align: left;">ex_15_sample.txt:</h3>
    </div>
    <div>
      <pre class="brush:plain"><span style="color: red;"><b>This is stuff I typed into a file.</b></span><br /><br />It is really cool stuff.<br /><br />Lots and lots of fun to have in here.</pre>
    </div>
  </div>
  <div>Do you see what Ruby tried to do here? &nbsp;<i>gets.chomp</i>&nbsp;already has the filename from ARGV, but <i>instead of reading the filename, it reads the first line of the file</i>.</div>
  <div>
    <h2 style="text-align: left;">Scenario 3: gets.chomp with a hacked input file</h2>
  </div>
  <div>If gets.chomp take the first line of the file named by ARGV, what would happen if I hack the text file and put the name of the second file in the first line?<br /><br />
    <h3 style="text-align: left;">ex_15_sample_hacked.txt:</h3>
  </div>
  <div>
    <pre class="brush:plain"><b>ex_15_sample_2.txt</b><br /><br />This is stuff I typed into a file.<br /><br />It is really cool stuff.<br /><br />Lots and lots of fun to have in here.</pre>
  </div>
  <div>
    <div>
      <h3 style="text-align: left;">Script:</h3>
    </div>
    <pre class="brush:ruby"><br /># Get the input file<br />filename = ARGV.first<br /><br /># Declare a variable to open the input file<br />txt = open(filename)<br /><br /># Output the contents of the input file<br />puts "Here's your file #{filename}"<br />print txt.read<br /><br /># Ask the user to name the input file, implicitly in the local directory<br />print "Type the filename again: "<br /><br /># Use stdin to obtain the name of the input file from the local directory<br /># file_again = $stdin.gets.chomp<br />file_again = gets.chomp<br /><br /># Declare another variable to open the input file again<br />txt_again = open(file_again)<br /><br /># Output the contents of the input file again<br />print txt_again.read</pre><br />
    <div style="-webkit-text-stroke-width: 0px; color: black; font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-caps: normal; font-variant-ligatures: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;"></div><br />
    <div style="orphans: 2; text-align: left; text-indent: 0px; widows: 2;">
      <div style="-webkit-text-stroke-width: 0px; color: black; font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-caps: normal; font-variant-ligatures: normal; font-weight: normal; letter-spacing: normal; text-transform: none; white-space: normal; word-spacing: 0px;">
        <h3 style="margin: 0px; text-align: left;">Command in terminal:</h3>
      </div>
      <pre class="brush:bash">$ ruby ex15.rb ex_15_sample_hacked.txt&nbsp;</pre>
      <h3 style="text-align: left;">Output:</h3>
      <pre class="brush:plain">Here's your file ex_15_sample_hacked.txt<br /><br />ex_15_sample_2.txt<br /><br />This is stuff I typed into a file.<br /><br />It is really cool stuff.<br /><br />Lots and lots of fun to have in here.<br /><br />Type the filename again: THIS IS STUFF I TYPED INTO A FILE.<br /><br />IT IS REALLY COOL STUFF.<br /><br />LOTS AND LOTS OF FUN TO HAVE IN HERE.</pre>
    </div>
  </div>
  <div>
    <h3 style="text-align: left;">Observations:</h3>
  </div>
  <div>
    <ol style="text-align: left;">
      <li>The first part of the script read the input file from ARGV.</li>
      <li>The second part of the script <i>read as input the first line of the input file from ARGV</i>.</li>
    </ol>
    <h2 style="text-align: left;">Conclusions</h2>
  </div>
  <div>
    <ol style="text-align: left;">
      <li>If you want to prompt the user for input, use $stdin.gets.chomp.</li>
      <li>If you want to trick the program into using the first line of the first file supplied to ARGV, gets.chomp is an option, but a better way to do it would simply be to declare the variable in your code.</li>
    </ol>
  </div>
</div>
