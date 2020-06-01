---
layout: post
title:  FizzBuzz: TDD, Ruby, RSpec, Guard
date:   Mon  1 Jun 17:19:52 AEST 2020
tags: [ruby, rspec, code]
---
## Introduction

What I will present to you in this video may be called "Rock Soup FizzBuzz", because much like the fairytale, what makes this solution interesting is not the eponymous ingredient but rather everything else that goes into it, namely test-driven development, Ruby, RSpec, Guard, and Neovim.

In order to show how everything fits together, I have to show you three buffers: the code, the test, and a live terminal running Guard, which will re-run the test whenever I make a change. I will also jump into a IRB terminal on occasion.

## Describe the Solution

By way of introduction to FizzBuzz let's go through the expectations in `fizz_buzz_spec.rb`:

[Talk through the `FizzBuzz` describe block]

## First Solution

The simplest solution is an IF-ELSIF-ELSE statement.

[Talk through first solution]

## Defects of the First Solution

The one advantage of this solution is that the code is very obvious.

However, there are numerous problems with it:

1. The conditional values are hard coded.
2. The conditions themselves are hard coded.
4. The return values are hard coded.
5. The method does not consistently return the same object type.
6. The code is not DRY.
7. The code is not scalable.
8. The code is not extensible.

To better understand these defects, imagine that you need to write code that can play the FizzBuzz game, but with a twist:

* `Fizz` if divisible by 3
* `Bash` if the square root is a whole number
* `FizzBash` if both divisible by 3 and a whole-number square root

Even though FizzBang is essentially identical to FizzBuzz, none of the code already written could be used for it, and without changing the FizzBuzz solution, we'd have to write out the the new one all over again.

Of course, here it's only a few lines of code, but developers all over the world spend hours, days, even weeks dealing with the consequences of legacy code written in this way.

## DRYing Our Code

The best way to think about improving code is to refactor existing functionality, because by doing so we think through the original with the advantage of a solution -- albeit a defective one -- to hand.

The first thing to notice is that the string **FizzBuzz** is a concatenation of **Fizz** and **Buzz**.  What that means is that we can return it like this:

```ruby
%w[Fizz, Buzz].join
  => "FizzBuzz"
```

Of course in a range from 1 through 15, this would only be the correct return value for 15.So what does Ruby give us if one of those strings is `nil`?

```ruby
['Fizz', nil].join
  => 'Fizz'

[nil, 'Buzz'].join
  => 'Buzz'
```

Furthermore, if the array contains only `nil` values, the `#join` will return `nil`.

This means that if the number meets any of the conditions, rather than returning a *String literal*, we can return a `join`ed *Array* instead: if it meets both conditions, the Array will contain both strings; if only one condition, just that string; and if neither, then `nil`.

And if `#join` on the Array returns `nil`, we can return the original number.

Putting all that together, rather than returning a string literal or an integer, the two variables `fizz` and `buzz` are alternately declared.

At the end of the method, we use a ternary conditional to return either the joined Array, or the original number.

As you can see, this code passes the test; although it is longer than the original solution, there's potential for considerable improvement.

## DRYing further

In Ruby, if you pass a variable that has not been declared, it is treated simply is `nil`.
This means that there is no difference here between declaring `fizz = nil` and simply not declaring it at all.

Thus, if we delete the `nil` declarations, we see that the code is functionally unchanged and continues to pass the test.

## DRYing even further

The method has changed in an important way: rather than returning one of a few hard-coded values, it always returns the return value of the ternary conditional: whether the variable `fizz` or `buzz` is `nil` or not, we always pass it to the Array at the end of the method.

In Ruby, this can be expressed succinctly on a single line for each value, which thus removes the need for a traditional multi-line IF-ELSE statement, and reduces our method to just three lines, which still passes the test.

At this point, I think it's fair to say that this code is sufficiently refactored for us to take a step back and think more broadly about the problem.

## Modulo Operator

An abstraction of FizzBuzz is as follows:

> If the dividend mod the first divisor evaluates to zero, return the first string.
> If the dividend mod the second divisor evaluates to zero, return the second string.
> If the dividend mod both the first and second divisors evaluates to zero respectively, return a concatenation the first and second strings.
> If the dividend mod neither the first nor the second divisor evaluates to zero, return the dividend.

Thus we have the following variables:
1. dividend (a)
2. first divisor (n1)
3. first string (s1)
4. second divisor (n2)
5. second string (s2)

We could write a method that takes all five variables, but given that the dividend is applied to the each pair of divisor and string respectively, it would be better put them together.

The arrangement that in my view strikes the balance between succinctness and readability is a method that takes two arguments: an integer `a` for the divisor, and an Array of Hashes `hsh_ary`, wherein each Hash contains two key-value pairs: `divisor` and `output`.

Thus a concise abstraction of the FizzBuzz method is as follows:

Declare a variable `str`, whose value is the output of a `map` of the Array of Hashes.
Within each iteration of the `map` block,  return the `output` string if the dividend `a` mod the `divisor` evaluates to zero -- if not, `map` automatically returns `nil.`
Having iterated through both of the Hashes (or all, if there be more), the return value of `map` is an Array of either string, nil values, or a combination thereof, which is exactly the same as the Array at the end of refactored `fizz_buzz` method.

Thus the abstracted method ends in the same way with a ternary conditional.

## Application of Abstraction

Having abstracted the core logic into the `modulo_string_or_integer` method, our new `fizz_buzz` method simply has to provide the necessary arguments: it creates an Array of two Hashes, each one containing two key-value pairs -- `divisor` and `output` --, which it passes to the abstracted method along with the divisor `a`, which it receives from the caller.

## Further Abstraction

The method `modulo_string_or_integer` nevertheless hardcodes one element of the FizzBuzz game: **divisibility**.

If we want a truly dynamic method, we need to abstract not only the handling of the inputs and outputs, but also the conditions applied to those variables.

Let's create an abstraction called `conditional_string_or_integer`, which takes two arguments: an input and an Array of Hashes.

For the sake of not overly abstracting this presentation, let's stay within the realm of mathematical operations and assume that the input is a number, but by the same token it could be a string or a boolean, or an object of our own making.

Each Hash in the Array must contain the following key-value pairs: `condition` and `output`.

Just as the `modulo_string_or_integer` method, this method will also generate a string by iterating through the Array of Hashes and `join`ing the resulting Array of values.

The key difference is that the `condition` is not a value, but rather a piece of logic to which the input variable is supplied.

In Ruby, this can be easily achieved with a **lambda** expression.  The simplest way of thinking of a lambda is that it is like a method definition inside a method definition.

### FizzBuzz

This iteration of `fizz_buzz`, will again pass an Array of Hashes to the abstracted method, but first it has to define the `condition`s:

1. `fizz_condition` takes an input and evaluates whether it is divisible by 3.
2. `buzz_condition` taken an input and evaluates whether it is divisible by 5.


### FizzBang

As I said earlier, one defect of the original FizzBuzz solution is that it hardcodes the `modulo` operation.  Now that we have a more dynamic method, let's create a method called `fizz_bash`, the twist on FizzBuzz that combines **divisibility** and **square-root** evaluations.

The `fizz_bash` method, much like the latest iteration of `fizz_buzz`, will pass an Array of Hashes to the abstracted method, but first it has to define the `condition`s:

1. `fizz_condition` takes an input and evaluates whether it is divisible by 3.
2. `bash_condition` taken an input and evaluates whether its square root is a whole number.

To test FizzBash, let's return to our Spec file and create a set of expectations...

As we can see, FizzBash, much like FizzBuzz, passes the test.

### FizzBuzz

To return to FizzBuzz, we can go one better, and save ourselves two lines of code, by putting the lambda definition directly into each Hash.  It would be worthwhile to declare the lambdas as variables if we used them many times, but there are short enough to fit comfortably on a single line each.

## FizzBash

By the same token, `fizz_bash` can dispense with the redundant lines.

## Test I/O
