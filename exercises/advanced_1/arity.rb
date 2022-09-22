=begin # Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')
=end
# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
Group 1:
line 3 outputs a string representation of the `Proc` object that has been assigned to the variable `my_proc`.
line 4 outputs the class that `my_proc` belongs to, which is `Proc`.
When the code in line 5 is executed, the block variable `thing` has not been passed a value; it's evident from the output that it has been implicitly assigned the stand-in value `nil`. This happens because `Proc`s have *lenient arity*.
The code in line 6, by contrast, does assign a value to the block variable. The code within the block is carried out as expected.

Group 2:
These objects are defined as lambdas (in two different ways, evidently) but Ruby stores them as `Proc` objects. Thus, lambdas must be a type of `Proc`.
It's also evident from the error thrown on line 15 that lambdas have *strict arity*.

Group 3:
In line 23, a value is passed in to the method and assigned to the method local variable; however, this variable is not yielded to the block explicitly when `yield` is called. Thus, no value (other than `nil`) gets assigned to the block variable.
In line 24, an error is thrown because `yield` is called when there is no block for the method to yield to.

Group 4:
On line 31, the string `"turtle"` is passed in to the method and assigned to the method variable `animal`. Then `animal` is passed to the block via `yield` and assigned to the block variable `turtle`, which is referenced and output within the block.
On lines 32-34, the same thing happens except that the block is defined to take two block variables, not just one. However, this is not an issue due to the block's lenient arity. When the method yields only one variable to the block, the next variable is implicitly assigned `nil`.
On line 35, the block has no block variable defined, and when it tries to access the method local variable `animal`, an error is thrown. This is because `animal` is out of scope.
=end
