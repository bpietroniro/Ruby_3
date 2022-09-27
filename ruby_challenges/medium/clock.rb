=begin

PROBLEM
- create a `Clock` class that doesn't use any built-in date/time stuff
- include functionality for adding/subtracting minutes from a Clock object

EXAMPLES
- we need a `Clock` class with:
  - an `at` method
    - takes two integer arguments: one obligatory (h) and one optional (m)
    - converts these to a 4-digit string representing the time
      (e.g. '08:00') military style
    - maybe `at` is a constructor alias???
    - because we can add/subtract with the result of `Clock.at()` and call
      `to_s` on the result
    - which means we need `-`, `+` instance methods that take an integer arg
      - these need to be able to "wrap around" when given arguments that
        send the time past 24 hours or behind 0 hours
    - and a `to_s` method
    - and a `@time` attribute while we're at it
    - and a '==' method that says two clocks are equivalent when they show
      the same time

DATA STRUCTURES
- instance variables to hold the hours and minutes of the Clock's time
  (these will be integers)

ALGORITHM
adding/subtracting minutes:
- add/subtract new minutes to current @minutes
- call adjustment helper method
- return self
adjustment:
- take @minutes divmod 60
  - add the quotient to @hours
  - make sure @hours is between 0-23 by using modulo 24
  - save the remainder as @minutes

=end

class Clock
  HOURS_IN_DAY = 24
  MINUTES_IN_HOUR = 60

  def self.at(h, m=0)
    Clock.new(h, m)
  end

  def initialize(h, m)
    @hours = h
    @minutes = m
    # this validates the input even though the problem doesn't require it
    adjust_time
  end

  def +(minutes_later)
    @minutes += minutes_later
    adjust_time
    self
  end

  def -(minutes_earlier)
    @minutes -= minutes_earlier
    adjust_time
    self
  end

  def ==(other_clock)
    hours == other_clock.hours && minutes == other_clock.minutes
  end

  def to_s
    format('%02d:%02d', hours, minutes)
  end

  protected

  attr_accessor :minutes, :hours

  private

  def adjust_time
    # in Ruby, divmod will always make the quotient negative if the caller
    # is negative, which is exactly what we want here
    q, r = minutes.divmod(MINUTES_IN_HOUR)
    @hours += q
    # The official solution warns against using %, but I prefer it.
    # This calculation is straightforward, and since we're only trying to
    # write the problem in Ruby at the moment, how other languages might
    # implement modular arithmetic is irrelevant.
    @hours %= HOURS_IN_DAY
    @minutes = r
  end
end
