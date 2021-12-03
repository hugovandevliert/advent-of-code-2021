input = File.read('input/day_3').split("\n")

co_numbers = input
co2_numbers = co_numbers.dup

12.times do |i|
  count = co_numbers.count { |n| n[i] == '0' }
  bit = count > co_numbers.size / 2 ? '0' : '1'

  co_numbers.select! { |n| n[i] == bit }

  break if co_numbers.count == 1
end

12.times do |i|
  count = co2_numbers.count { |n| n[i] == '1' }
  bit = count < co2_numbers.size / 2 ? '1' : '0'

  co2_numbers.select! { |n| n[i] == bit }

  break if co2_numbers.count == 1
end

o2 = co_numbers.join.to_i(2)
co2 = co2_numbers.join.to_i(2)

puts o2 * co2
