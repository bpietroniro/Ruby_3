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

p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []
