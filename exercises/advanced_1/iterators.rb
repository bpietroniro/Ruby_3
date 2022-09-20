factorial = Enumerator.new do |p|
  a = b = 1
  p << a
  loop do
    p << a*b
    b = a*b
    a += 1
  end
end

p factorial.take(7)
