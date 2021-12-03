input = File.read('input/day_1').lines.map(&:to_i)

count = 0
prev_sum = input.first(3).sum

input.each_with_index do |n, index|
  n2 = input[index + 1]
  n3 = input[index + 2]
  next unless n2 && n3

  sum = n + n2 + n3
  count += 1 if sum > prev_sum
  prev_sum = sum
end

puts count
