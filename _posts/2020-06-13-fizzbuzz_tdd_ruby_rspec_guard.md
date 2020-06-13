---
layout: post
title:  FizzBuzz: TDD, Ruby, RSpec, Guard
date:   Sat 13 Jun 08:38:42 AEST 2020
tags: [ruby, rspec, code]
---
# FizzBuzz Rock Soup

This walkthrough of a FizzBuzz solution demonstrates the following:
* behaviour-driven development and sound English
* certain features of the Ruby language that lend themselves to DRY code
* test-driven development with RSpec and Guard
* Neovim as an integrated development environment
* my personal `ruby-template` gem for cutting through the setup boilerplate

For the sake of brevity, the walkthrough is expressed a step-by-step instructions, rather than as a description in the first person.

## Contents

The demonstration runs as follows:
1. Clone the `ruby-template` gem from my public repository on Github set up the project for test-driven development.
2. Specify the required outputs of a FizzBuzz solution in an RSpec test. ('Spec')
3. Provide the most obvious, facile solution. (IF-ELSE statement)
4. Refactor the facile solution without extending its functionality.
5. Define the solution more expansively using a behaviour-driven approach, and reconfigure the project so as to facilitate better namespacing.
6. Abstract the rules of the FizzBuzz game into a Module called **Rules**.
7. Abstract the mechanics of the FizzBuzz game into a Class called **Engine**.
8. Add a Spec that provides batch input to and checks the batch output of **FizzBuzz**.
9. Write a Spec for **FizzBashBang**, a new game which builds on **FizzBuzz**.
10. Add new rules -- **Bash** and **Bang** and satisfy the **FizzBashBang** Spec.
11. Write a Spec for **FizzBuzzBashBoom**, which builds on both **FizzBuzz** and **FizzBashBang**.
12. Add a new rule called **Boom**, and satisfy the **FizzBuzzBashBoom** Spec.
13. Extract the games to a separate Module called **Games**.
14. Create a **Util** Module with a `#fibonacci` method, used by both a Spec and the **Rules** Module.
15. Refactor the codebase and mix the Util methods into a Class and another Module.

## 1. Project setup

Go to my Github
