input = File.read('input/day_6').split(',').map(&:to_i)

counts = {}
9.times { |i| counts[i] = 0 }
input.map { |n| counts[n] += 1 }
fish = counts.values

256.times do
  fish.rotate!
  fish[6] += fish.last
end

puts fish.sum
