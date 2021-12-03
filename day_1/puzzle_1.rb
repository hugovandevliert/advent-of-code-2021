input = File.read('input/day_1').lines.map(&:to_i)

count = 0
prev_num = input.first

input.each do |num|
  count += 1 if num > prev_num
  prev_num = num
end

puts count
