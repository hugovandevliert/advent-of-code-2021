input = File.read('input/day_7').split(',').map(&:to_i)

crabs = input.sort!

median = crabs[crabs.size / 2]

diff = crabs.map { |c| (c - median).abs }

puts diff.sum
