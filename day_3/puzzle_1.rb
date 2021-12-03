input = File.read('input/day_3').split("\n")

counts = input.map(&:chars).transpose.map(&:tally)

gamma = ''
epsilon = ''

counts.map do |c|
  min, max = c.values.minmax

  gamma += c.key(max)
  epsilon += c.key(min)
end

puts gamma.to_i(2) * epsilon.to_i(2)
