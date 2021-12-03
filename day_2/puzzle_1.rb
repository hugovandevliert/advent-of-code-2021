input = File.read('input/day_2').lines

pos = 0
depth = 0

def calculate_new_values(current_pos, current_depth, move)
  direction, value = move.split

  case direction
  when 'forward' then current_pos += value.to_i
  when 'down' then current_depth += value.to_i
  when 'up' then current_depth -= value.to_i
  end

  [current_pos, current_depth]
end

input.each do |move|
  new_pos, new_depth = calculate_new_values(pos, depth, move)

  pos = new_pos
  depth = new_depth
end

puts "Horizontal position: #{pos}"
puts "Depth: #{depth}"
puts "Total sum: #{pos * depth}"
