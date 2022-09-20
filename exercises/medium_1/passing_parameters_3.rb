items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*others, last|
  puts others.join(', ')
  puts last
end

gather(items) do |first, *others, last|
  puts first
  puts others.join(', ')
  puts last
end

gather(items) do |first, *others|
  puts first
  puts others.join(', ')
end

gather(items) do |*others, last|
  puts "#{others.join(', ')}, and #{last}"
end
