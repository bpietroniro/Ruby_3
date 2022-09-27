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
- do we want a hash for schedules => ranges?
- or another one to hook up weekday strings with weekday methods from `Date`?
  - nope, just use `send`

ALGORITHM
This solution is a result of a bunch of refactoring I did after finding a first
working solution (meetup.rb).

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
    schedule_sym = schedule.downcase.to_sym
    weekday_checker = (weekday.downcase + '?').to_sym
    start_of_seven_day_period = first_day_to_check(schedule_sym)
    get_date(weekday_checker, schedule_sym, start_of_seven_day_period)
  end

  def first_day_to_check(schedule)
    case schedule
    when :first then 1
    when :second then 1 + DAYS_IN_WEEK
    when :third then 1 + 2 * DAYS_IN_WEEK
    when :fourth then 1 + 3 * DAYS_IN_WEEK
    when :fifth then 1 + 4 * DAYS_IN_WEEK
    when :teenth then 13
    else -1
    end
  end

  def get_date(weekday_checker, schedule, start_of_seven_day_period)
    date = Date.civil(year, month, start_of_seven_day_period)
    loop do
      break if date.send(weekday_checker)
      schedule == :last ? date -= 1 : date += 1
    end
    date.month == month ? date : nil
  end
end
