---
layout: post
title:  "FizzBuzz: TDD, Ruby, RSpec, Guard"
date:   "Sat 13 Jun 08:38:42 AEST 2020"
tags: [ruby, rspec, code]
---
# FizzBuzz Rock Soup
## *A FizzBuzz Solution in Test-driven Development With Ruby, RSpec, Guard, and VIM

This walkthrough of a FizzBuzz solution demonstrates the following:
* behaviour-driven development and sound English
* certain features of the Ruby language that lend themselves to DRY code
* test-driven development with RSpec and Guard
* Neovim as an integrated development environment
* my personal `ruby-template` gem for cutting through the setup boilerplate

For the sake of brevity, the walkthrough is expressed as step-by-step instructions, rather than as a description in the first person.


## Notes on Presentation

This walkthrough is not intended to be viewed on a small screen, but rather in full screen on a desktop computer.  The reason for this is that the presentation captures precisely the sort of things that I see in my daily work.

## Contents

The demonstration runs as follows:
1. Clone the `ruby-template` gem from my public repository on Github and set up the project for test-driven development.
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

* Clone the github repository [ruby-template](https://github.com/clockworkpc/ruby-template).
* Make sure the following gems are in the Gemfile:

```ruby
source 'https://rubygems.org'
gemspec

group :development do
  gem 'did_you_mean' # Useful for terminal output
  gem 'guard-rspec' # Both Guard and RSpec
  gem 'rubocop', require: false # Rubocop
end
```

I recommend putting them all in the `development` group unless you have a particular reason to do otherwise.
* Open `bin/project_details.json` and change the `new` keys to `FizzBuzz` in Pascal case for the Module name and `fizz_buzz` in snake case for the spec name.
* Execute `/bin/setup`, which installs the gems and then runs `setup.rb`, which performs a project-wide string replacement of the current name ("Ruby Template") to "Fizz Buzz", and the runs the full `rspec` test suite.
* Make sure all the Specs pass before proceeding.  If they do not, there is a good chance that something has been misnamed.

## 2. FizzBuzz Specification

* The project should provide the Spec file `spec/fizz_buzz_spec.rb` and start Spec using the method `RSpec.describe`, to which all the Specs are passed as a block.  If not, create one.
* Require `spec_helper`.  In a Ruby gem, I recommend loading the bare minimum of files `spec_helper`, because as the project grows, the test suite will take longer to start up.  However, it is very convenient to "eagerly" load all of the requisite files, so work out an acceptable trade-off between performance and convenience.  In this walkthrough the difference is negligible.
* Open a terminal at the project root and run `bundle exec guard`.  A common Ruby practice is to alias `be` to `bundle exec`.
* Confirm that the Guardfile is configured to watch both the `lib` and `spec` directories.  In `ruby-template`, the `Guardfile` has a custom method called `#watch_spec_and_lib_files`.  If it only watches the `spec` folder, you will have to continually re-save the Spec files in order to trigger `rspec`, which is tiresome.
* Save the file.  Note that Guard triggers RSpec to execute the saved file.  As there are no tests, there are no failures either, yet.


* Write a simple `hello_world` test, to ascertain whether the Spec has access to its test target.  As the methods will be mixed in, do not prepend the method name by `subject.`

### NOTE ABOUT CLASS vs MODULE

This step deviates from the standard practice of creating a Class with an instance method in order to demonstrate the advantages and disadvantages of Modules and Mixins.  Later in this walkthrough, the primary object of the program will be a Class.

* Note the error: There is no method called `hello_world` available to the Spec, because the Spec does not have any methods mixed into it.
* `include` the Module `FizzBuzz`.
* Note the error: This time there is such method for `FizzBuzz`.
* In `fizz_buzz.rb`, write an instance method called `hello_world` that returns the wrong output.  Save the file and note that it too triggers Guard to run `fizz_buzz_spec.rb`.  This is because Guard associates `fizz_buzz.rb` and `fizz_buzz_spec.rb` by their corresponding locations and matching file names.
* Note the error: the correct method was invoked, but the return value was wrong -- as intended.
* Correct the method to return `hello world`.  The Spec now passes.
* Delete both the "hello world" test and method.  They have served their purpose, for we now know that the Spec can invoke the instance methods in the Module.

## 3. The Worst, Most Obvious Solution

**IF** the work specification is nothing more than to write code that returns the correct value, an IF statement is fine: it arguably satisfies three out of [thoughtbot's four attributes of good code](https://thoughtbot.com/blog/what-is-good-code):

| Principle                         | Answer |
|-----------------------------------|--------|
| *The code works.*                 | TRUE   |
| *The code is easy to understand.* | TRUE   |
| *The code is easy to change.*     | TRUE   |
| *The code is fun to work with*    | FALSE  |

**HOWEVER**, in the real world of commercial software, we are not paid to practice isolated coding katas (even though that is my idea of a good time), but rather to balance competing, equally important considerations as we solve complex problems.

I ask myself these and other questions every day:

> Does the code make it easier to solve harder problems, or harder to solve easier problems?

> Does it take more or less time to track down a bug?

> Do I look forward to adding a new feature or extending existing functionality, or do I dread doing so for fear of breaking something?

Implicit in these questions are considerations of [comprehensibility, reviewability, error rate, debugging, modifiability, development time, and external quality](https://developerzen.com/how-do-you-define-good-code-c8a383c207a4).

To return to the task at hand:

First the "FizzBuzz" solution will be delivered according to this facile specification, and then refactored.

Thereafter, the walkthrough concerns itself with creating a mechanism that first and foremost delivers the same functionality, but which, more importantly, makes it *easier* to solve *harder* problems.

* In `fizz_buzz.rb`, create an __empty__ method called `fizz_buzz`, which takes a single argument called **dividend**.  This is the correct mathematical term for a variable in a **modulo** operation, which is the core of the FizzBuzz game.
* Write a test to check the return value when the input is divisible by 3.
* Note the error: expected "Fizz", got **nil**.
* Write a simple **IF** statement that satisfies the test.
* Write a test to check the return value when the input is divisible by 5.
* Expand the if statement to satisfy both tests.
* Because my IDE runs **Rubocop** asynchronously, it indicates to me that the recommended syntax for a modulo operation that checks for divisibility is the `#zero?` method.  Satisfy Rubocop by amending those lines.
* Write a test to check the return value when the input is divisible by both 3 and 5.
* Expand the if statement again to satisfy the tests.
* Note the error: putting the combined condition last fails the test, because a Ruby IF statement does not fall through.  (This is achieved by declaring a null value, which I will use when refactoring this code)
* Put the combined condition first and confirm that the tests pass.
* Write a test to check the return value when the input is divisible by neither 3 nor 5.
* Return the *dividend* in the `else` condition.
* When all the tests from 1 to 15 pass, the solution is complete.

> 1. The output should be "Fizz" when the input is divisible by 3. (3, 6, 9, 12)
> 2. The output should be "Buzz" when the input is divisible by 5. (5, 10)
> 3. The output should be "FizzBuzz" when the input is divisible by both 3 and 5. (15)
> 4. The output should be the input if it is divisible by neither 3 nor 5. (1, 2, 4, 7, 8, 11, 13, 14)

## 4. Refactoring the Worst, Most Obvious Solution

### Reducing the Outputs from Four to Two

There are two problems with this method's output:
1. It does not always return the same type of object -- either a String or an Integer.
2. It returns four different results based on four different conditions.

Ideally, the method's output should always be either a String or an Integer, and the values should ultimately be the result of the same operation.

Given that this method has to return either a String or Integer according the specifications, it should have only two kinds of return value: a String if at least one of the conditions is satisfied, or an Integer if no condition is satisfied; and the String should be the result of an operation that returns 'Fizz', 'Buzz', 'FizzBuzz', or nothing if none of the conditions is satisfied.

### Joining an Array of Strings

The key to the required String operation is the following set of observations:
- 'FizzBuzz' is a concatenation of both 'Fizz' and 'Buzz',
- 'Fizz' is the same concatenation without 'Buzz',
- and the inverse is true of 'Buzz'.

To express this in Ruby, call the `join` method on an Array containing two variables, `fizz` and `buzz`, which can be either its namesake or **nil**:

```rb
[fizz, buzz].join
```

Thus:
- if the variable `fizz` returns the String 'Fizz' and `buzz` 'Buzz', the return value of the joined Array is 'FizzBuzz';
- if the variable `fizz` returns the String 'Fizz' and `buzz` is **nil**, the return value of the joined Array is 'Fizz';
- if the variable `buzz` returns the String 'Buzz' and `fizz` is **nil**, the return value of the joined Array is 'Buzz';
- if both `fizz` and `buzz` are **nil**, the joined Array returns nothing.

Apply this insight to the `fizz_buzz` method.

### Declaring variables

In each of the positive conditions, declare the variables `fizz` and `buzz`, and assign the values accordingly:

- If divisible by 3 and 5, `fizz` is 'Fizz' and `buzz` is 'Buzz'
- If divisible by 3, `fizz` is 'Fizz' and `buzz` is **nil**.
- If divisible by 5, `buzz` is 'Buzz' and `fizz` is **nil**.

In order to satisfy the tests, return the joined Array of `fizz` and `buzz` for each satisified condition, otherwise return the dividend.

### IF-ELSE

At the end of the method, declare a variable `result` which gives the return value of a joined Array of `fizz` and `buzz`.

Write an IF-ELSE statement, which returns the original dividend if the `result` is **nil** -- that is to say, if the number is divisible by neither 3 nor 5 -- or returns the `result`, i.e. if the number is divisible by either 3 or 5, or both.

This fails the test because the return value of a joined Array of two **nil** values in Ruby is not **nil**, but it is empty.

Change the `.nil?` method to `.empty?`.  The test now passes.

### Ternary Conditional

A more elegant way of expressing an IF-ELSE statement is a *ternary conditional*, which is composed of the following elements:
- condition
- question mark
- return value if true
- colon
- return value if false

A simple example is to return "TRUE" if 100 is greater than 1, otherwise to return false.

```rb
100 > 1 ? 'TRUE' : 'FALSE'
```

This obviously returns 'TRUE'.

Change the condition to something obviously false, e.g. 100 is less than 1, and it returns 'FALSE'.

Thus, wherever the condition is **boolean**, the IF-ELSE statement can be expressed on a single line as a ternary conditional.

Apply this insight to the IF-ELSE statement at the end of the method, by expressing it as follows:

- `result.empty?`
- question mark
- `dividend`
- colon
- `result`

Delete the redundant IF-ELSE statement.  The tests pass.

## Remove Superfluous Conditions

Because the method returns the joined Array if one of the conditions is satisfied, it is no longer necessary to return the joined Array for each positive condition.  Delete all the joined arrays except the one at the end.  The tests still pass.

By the same token, because the variables `fizz` and `buzz` are defined at some point in the method, it is not necessary to define either of them as `nil`: the joined Array at the end of the method will return the same concatenation.  Delete the **nil** declarations of `fizz` and `buzz`.  The tests still pass.

Similarly, the ELSE condition is redundant, thanks to the ternary conditional.  Delete the ELSE condition.  The tests still pass.

Finally, the same principle applies to the rest of the original IF statement.  Write the following two lines, and comment out the original IF statement, and re-run the tests.

1. `fizz` returns 'Fizz' if the dividend is divisible by 3.
2. `buzz` returns 'Buzz' if the dividend is divisible by 5.

The tests still pass.  Delete the commented code.

The new method retains all of the original functionality in three lines of Ruby code rather than eleven.

# 5. Reconceptualisation

Until now, the specification has been very narrow: a method that returns the correct output.
However, a more realistic specification would be to create a **mathematics game engine**, which could be used to create not only a FizzBuzz game, but many similar games too.

## Rename the Project

Change the name of the project from `fizzbuzz` to `math_games`.

Throughout the project, change the module name from FizzBuzz to MathGames (in Pascal case), all spec names from `fizz_buzz` to `math_games`.
Apply this change to file names, and all matching strings within the files.

Make sure that all the specs still pass; if they do, the changes are probably sufficient.

## MathGames::Rules

Create a Spec for a yet-to-be-created module `MathGames::Rules`.

Write a 'hello_world' Spec to get started.

Create the file `lib/math_games/rules.rb`, define it as a submodule `MathGames::Rules`, and write a `hello_world` method to satisfy the Spec.

The Spec initially fails because the library file is not included in `spec_helper`.

Require it in the `spec_helper`.  The test now passes.

Write a Spec for a class method `MathGames::Rules.hello_self`.

Write a method called `#hello_self`.

The test fails because it is not a class method, but still an instance method.

Prepend the keyword `self` to the method definition, so that the method headers reads `def self.hello_self`.  The test now passes.

As the tests have established that both instance and class methods can be tested in this spec, they are no longer necessary.

In a `before(:all)` block, declare a variable called `@rule`, which is a `modulo` class method with the arguments *Integer* 3 and *String* 'Fizz'.  This will return a *Hash* containing two key-value pairs: `:result` and `condition`.

Declare two instance variables, which will be available to the `it` blocks of the test:
- `@result`, which returns the value of the key `result` in the variable `rule`.
- `condition`, which returns the value of the key `condition` in the variable `rule`.


Write a test that `@result` returns the string input *String* 'Fizz'.

In `math_games/rules.rb`, remove the redundant hello methods.

Write a method called `modulo`, which takes two arguments: `divisor` (*Integer*) and (*String*).  In the body, return a Hash composed of two key-value pairs:
- `condition`: a *lambda* that takes the argument `a` and returns whether *a mod divisor* equals zero, that is, whether `a` is divisible by the divisor.
- result: the input *String* `string`.

The test fails because `modulo` is not a class method.  Prepend `self` to its definition.  The test now passes.

Write a test that `@condition` returns **TRUE** if the dividend `a` is divisible by the divisor, by passing the *Integer* 9 to the *lambda* in `@condition`.  The test passes.

Write a test that `@condition` returns **FALSE** if the dividend `a` is not divisible by the divisor, by passing the *Integer* 8 to the *lambda* in `@condition`.  The test passes.
