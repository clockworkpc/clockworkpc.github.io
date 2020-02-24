---
layout: post
title: "Toy Robot Problem"
date: "2017-02-02"
author: "Alexander Garber"
tags: []
---

<div dir="ltr" style="text-align: left;" trbidi="on">
          <table align="center" cellpadding="0" cellspacing="0" class="tr-caption-container" style="margin-left: auto; margin-right: auto; text-align: center;">
            <tbody>
              <tr>
                <td style="text-align: center;"><a href="https://1.bp.blogspot.com/-J7dLfrS_HNk/WJJaUnB1oJI/AAAAAAAANMo/2T-CQJXE6PsTdMK1a0murvbI8KQ6oI6FwCPcB/s1600/toy_robot.png" imageanchor="1" style="margin-left: auto; margin-right: auto;"><img border="0" height="320" src="https://1.bp.blogspot.com/-J7dLfrS_HNk/WJJaUnB1oJI/AAAAAAAANMo/2T-CQJXE6PsTdMK1a0murvbI8KQ6oI6FwCPcB/s320/toy_robot.png" width="237"></a></td>
              </tr>
              <tr>
                <td class="tr-caption" style="text-align: center;">Refer to Ryan Bigg's book: <a href="https://leanpub.com/toyrobot">https://leanpub.com/toyrobot</a>
</td>
              </tr>
            </tbody>
          </table>
          <h2 style="text-align: left;">Code problem details: Toy Robot Simulator</h2>
          <h3 style="text-align: left;">Description:</h3>The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units. There are no other obstructions on the table surface. The robot is free to roam
          around the surface of the table, but must be<br>prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.<br><br>Create
          an application that can read in commands of the following form:<br>
          <blockquote class="tr_bq">PLACE X,Y,F<br>MOVE<br>LEFT<br>RIGHT<br>REPORT</blockquote>
<br>
          <ul style="text-align: left;">
            <li>PLACE will put the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner. The first valid command to the robot is a PLACE command, after
              that, any sequence of commands may be issued, in any order, including another PLACE command. The application should discard all commands in the sequence until a  valid PLACE command has been executed. </li>
            <li>MOVE will move the toy robot one unit forward in the direction it is currently facing. </li>
            <li>LEFT and RIGHT will rotate the robot 90 degrees in the specified direction without changing the position of the robot. </li>
            <li>REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.</li>
          </ul>
<br>A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT and REPORT commands. Input can be from a file, or from standard input, as the developer chooses. Provide test data to exercise the application.<br>
          <h3 style="text-align: left;">Constraints:</h3>The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.  Any move that would cause the robot to fall must be ignored.<br>
          <h4 style="text-align: left;">Example Input and Output:</h4>a)<br>
          <blockquote class="tr_bq">PLACE 0,0,NORTH<br>MOVE<br>REPORT<br>Output: 0,1,NORTH</blockquote>b)<br>
          <blockquote class="tr_bq">PLACE 0,0,NORTH<br>LEFT<br>REPORT<br>Output: 0,0,WEST</blockquote>c)<br>
          <blockquote class="tr_bq">PLACE 1,2,EAST<br>MOVE<br>MOVE<br>LEFT<br>MOVE<br>REPORT<br>Output: 3,3,NORTH</blockquote>
          <h3 style="text-align: left;">Deliverables:</h3>The source files, the test data and any test code.<br>It is not required to provide any graphical output showing the movement of the<br>toy robot.
        </div>