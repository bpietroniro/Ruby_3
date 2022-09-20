def missing(arr)
  result = []

  arr.each_cons(2) do |pair|
    current_num = pair[0]
    
    unless pair[1] == current_num + 1
      current_num += 1
      while current_num < pair[1]
        result << current_num
        current_num += 1
      end
    end
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# further exploration

def missing_2(arr)
  result = []
  counter = 0

  while counter < arr.size - 1
    pair = [arr[counter], arr[counter + 1]]
    result.concat(((pair[0] + 1)..(pair[1] - 1)).to_a)
    counter += 1
  end

  result
end

p missing_2([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_2([1, 2, 3, 4]) == []
p missing_2([1, 5]) == [2, 3, 4]
p missing_2([6]) == []
