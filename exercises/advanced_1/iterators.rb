factorial = Enumerator.new do |yielder|
  n = current_factorial = 1
  yielder << 1 # for 0! 
  loop do
    yielder << n * current_factorial
    current_factorial = n * current_factorial
    n += 1
  end
end

7.times { puts factorial.next }
3.times { puts factorial.next }
factorial.rewind
7.times { puts factorial.next }
