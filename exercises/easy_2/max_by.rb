=begin
- iterate through the collection
  - pass each item to the block
  - if the block's return value is larger than any previous, save it and save the item
=end

def max_by(collection)
  return nil if collection.empty?

  max_item = collection.first
  max_val = yield(max_item)

  collection[1..].each do |item|
    current_val = yield(item)
    if max_val < current_val
      max_val = current_val
      max_item = item
    end
  end

  max_item
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
