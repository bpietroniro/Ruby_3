# implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

# invocation
times(5) do |num|
  puts num
end

times(5) do
  puts 5
end
