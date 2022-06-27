def select(array)
  counter = 0
  output = []

  while counter < array.size
    if yield(array[counter])
      output << array[counter]
    end
    counter += 1
  end

  output
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }
p select(array) { |num| puts num }
p select(array) { |num| num + 1 }
