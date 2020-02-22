---
layout: post
title: "Refactor, Refactor, Refactor"
date: "2016-12-02"
author: "Alexander Garber"
tags: []
---

Original Code from_file, to_file = ARGVputs "Copying from #{from_file} to #{to_file}"# we could do these two on one line, how?in_file = open(from_file)indata = in_file.readputs "The input file #{indata.length} bites long"puts "Does the output file exist? #{File.exist?(to_file)}"puts "Ready, hit RETURN to continue, CTRL-C to abort."$stdin.getsout_file = open(to_file, 'w')out_file.write(indata)puts "Alright, all done."out_file.closein_file.closeExtremely Refactored CodeFile.new(ARGV[0], 'w').write(File.read(ARGV[1]))Acknowledgement: Picture from Flickr 