=begin

PROBLEM
- inputs: month (int), year (int), weekday (str), schedule (str)
  - examples of the schedule argument are "third", "last", "teenth", etc.
  - given these inputs, our program should be able to output the exact date
    of the meetup in the specified month and year.
  - all strings are case-insensitive
  - "teenth" means the day of the week that happens on one of days 13-19
    of the month
- class structure:
  - `Meetup` class
    - constructor that takes in the month and year
    - instance method `day` that takes in desired weekday and schedule
      and returns the date

EXAMPLES
- return nil if there is no such date (e.g. there's no fifth whatever)

DATA STRUCTURES
- store the month and day as instance variables
- probably use some built-in methods/structures from `Date`
- can use the range (1..7) to find the "first" of a particular day
  - from there, add 7 for the "second", 14 for the "third", 21 for the "fourth"
- can use the range (13..19) to find the "teenth" of a particular day
- for "last", need to do something different
- probably a hash to associate month strings with numbers 1-12
  - do we want another one for schedules => ranges?
  - or another one to hook up weekday strings with weekday methods from `Date`?

ALGORITHM
`day`
- save a symbol version of the schedule
- use that to send self to the appropriate helper method
`first`
- make a new `Date` object with the first of the given month in the given year
- loop
  - break if date.send(WEEKDAY_METHODS[weekday])
  - date += 1
- return the date
`second`
- find `first` and add DAYS_IN_WEEK to the day
(similar approach for `third`, `fourth`, `fifth`)
`last`
- make a new `Date` object with the given year and month, and day = -1
- loop
  - break if date.send(WEEKDAY_METHODS[weekday])
  - date -= 1
- return the date

=end
require 'date'

class Meetup
  DAYS_IN_WEEK = 7

  attr_reader :year, :month

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, schedule)
    schedule_method = schedule.downcase.to_sym
    weekday_method = (weekday.downcase + '?').to_sym
    send(schedule_method, weekday_method)
  end

  def first(weekday)
    date = Date.civil(year, month, 1)
    loop do
      break if date.send(weekday)
      date += 1
    end
    date
  end

  def second(weekday)
    first(weekday) + DAYS_IN_WEEK
  end

  def third(weekday)
    second(weekday) + DAYS_IN_WEEK
  end

  def fourth(weekday)
    third(weekday) + DAYS_IN_WEEK
  end

  def fifth(weekday)
    date = fourth(weekday) + DAYS_IN_WEEK
    date.month == month ? date : nil
  end

  def last(weekday)
    date = Date.civil(year, month, -1)
    loop do
      break if date.send(weekday)
      date -= 1
    end
    date
  end

  def teenth(weekday)
    date = Date.civil(year, month, 13)
    loop do
      break if date.send(weekday)
      date += 1
    end
    date
  end
end
