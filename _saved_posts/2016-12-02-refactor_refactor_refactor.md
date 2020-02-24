---
layout: post
title: "Refactor, Refactor, Refactor"
date: "2016-12-02"
author: "Alexander Garber"
tags: [ruby, code, study]
---

<div dir="ltr" style="text-align: left;" trbidi="on">
  <table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto; text-align: center;">
    <tbody>
      <tr>
        <td style="text-align: center;"><a href="https://c1.staticflickr.com/9/8494/8432392004_39d1505f6c_b.jpg" imageanchor="1" style="margin-left: auto; margin-right: auto;"><img alt="" border="0" height="239" src="https://c1.staticflickr.com/9/8494/8432392004_39d1505f6c_b.jpg"
              title="https://c1.staticflickr.com/9/8494/8432392004_39d1505f6c_b.jpg" width="320" /></a></td>
      </tr>
      <tr>
        <td class="tr-caption" style="text-align: center;"><br /></td>
      </tr>
    </tbody>
  </table>
  <h2 style="text-align: left;">Original Code</h2>
  <pre class="brush:ruby;"><br />from_file, to_file = ARGV<br /><br />puts "Copying from #{from_file} to #{to_file}"<br /><br /># we could do these two on one line, how?<br /><br />in_file = open(from_file)<br /><br />indata = in_file.read<br /><br />puts "The input file #{indata.length} bites long"<br /><br />puts "Does the output file exist? #{File.exist?(to_file)}"<br /><br />puts "Ready, hit RETURN to continue, CTRL-C to abort."<br /><br />$stdin.gets<br /><br />out_file = open(to_file, 'w')<br /><br />out_file.write(indata)<br /><br />puts "Alright, all done."<br /><br />out_file.close<br /><br />in_file.close</pre>
  <h2 style="text-align: left;">Extremely Refactored Code</h2>
  <div>
    <pre class="brush:ruby"><br /><b>File.new(ARGV[0], 'w').write(File.read(ARGV[1]))</b></pre>Acknowledgement: Picture from <a href="https://c1.staticflickr.com/9/8494/8432392004_39d1505f6c_b.jpg" target="_blank">Flickr</a>&nbsp;</div>
</div>
