input = File.read('input/day_2').lines

pos = 0
depth = 0
aim = 0

def calculate_new_values(current_pos, current_depth, current_aim, move)
  direction, value = move.split

  case direction
  when 'forward'
    current_pos += value.to_i
    current_depth += (current_aim * value.to_i)
  when 'down'
    current_aim += value.to_i
  when 'up'
    current_aim -= value.to_i
  end

  [current_pos, current_depth, current_aim]
end

input.each do |move|
  new_pos, new_depth, new_aim = calculate_new_values(pos, depth, aim, move)

  pos = new_pos
  depth = new_depth
  aim = new_aim
end

puts "Horizontal position: #{pos}"
puts "Depth: #{depth}"
puts "Aim: #{aim}"
puts "Total sum: #{pos * depth}"
