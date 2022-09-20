def ignore_first_two(arr)
  yield(arr)
end

birds = %w(raven finch hawk eagle)
raptors = ignore_first_two(birds) { |_, _, *raptors| raptors }
p raptors
