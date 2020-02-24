---
layout: post
title: "Rails Study, Day 4: Still Working on the Dev Environment"
date: "2017-03-29"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">So far I have spent time on the following:<br><br>
          <ol style="text-align: left;">
            <li>Vagrant</li>
            <li>Docker</li>
            <li>Digital Ocean Droplet</li>
            <li>Heroku</li>
          </ol>
          <div>However, I'm going to take a step back and reconsider what I'm trying to accomplish.</div>
          <h2 style="text-align: left;">What is my deliverable?</h2>
          <div>I want to build a Rails site, hosted on Heroku, that showcases my solutions to puzzles from Advent of Code.</div>
          <h2 style="text-align: left;">How is my work supposed to flow?</h2>
          <table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto; text-align: center;">
            <tbody>
              <tr>
                <td style="text-align: center;"><a href="https://1.bp.blogspot.com/-rFP0Yp9dyzk/WNsm-jdprkI/AAAAAAAAQYk/ZryVrE-tORIQeAfni5eQPGJ8Mze443uHACPcB/s1600/PHOTO_20170329_141225.jpg" imageanchor="1" style="margin-left: auto; margin-right: auto;"><img border="0" height="320" src="https://1.bp.blogspot.com/-rFP0Yp9dyzk/WNsm-jdprkI/AAAAAAAAQYk/ZryVrE-tORIQeAfni5eQPGJ8Mze443uHACPcB/s320/PHOTO_20170329_141225.jpg" width="180"></a></td>
              </tr>
              <tr>
                <td class="tr-caption" style="text-align: center;">Images, containers, Atom, etc.</td>
              </tr>
            </tbody>
          </table>
          <div>
            <ol style="text-align: left;">
              <li>Development environment (DE) is separate from the host operating system. (Docker container or VM)</li>
              <li>Text editor (Atom) has read/write access to the code in the DE.</li>
              <li>The DE can be easily duplicated for a sandbox server.</li>
              <li>Code from the DE can be pushed to Github; from Github, the latest code cloned.</li>
              <li>Changes from the DE can be pushed to Docker Hub; from DH the latest version of the DE.</li>
              <li>Production code from the DE can be pushed to Heroku; from Heroku, the latest production code, although that should be available in Github.</li>
            </ol>
          </div>
          <h2 style="text-align: left;">What are the specifications of my development environment?</h2>
<br>
          <div>
            <ol>
              <li>Version control of all relevant packages.</li>
              <li>Read/Write access to development environment from host.</li>
              <li>Access to online platform (Github, </li>
              <li>Available locally, without a constant internet connection.</li>
              <li>Totally accessible by Atom text editor on my host machine.</li>
              <li>Can upload code to Heroku, pull the latest code from Heroku, and push updated code to Heroku.</li>
              <li>Can push updates to the environment to a repository.</li>
            </ol>
            <h2 style="text-align: left;">What shall be my development environment?</h2>
            <ol>
              <li>Docker container for the DE, with all the necessary packages installed.</li>
              <li>Atom text editor installed on host.</li>
              <li>FTP access between DE and host.</li>
              <li>Github access from DE.</li>
              <li>Docker Hub access from DE.</li>
              <li>Heroku access from DE.</li>
            </ol>
          </div>
        </div>