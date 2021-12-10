input = File.read('input/day_10').split("\n")

def calculate_points(char)
  case char
    when ')' then 3
    when ']' then 57
    when '}' then 1197
    when '>' then 25137
  end
end

chars = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>'
}
points = 0

input.each do |line|
  open_chunks = []

  line.chars.each do |char|
    if chars.keys.include? char
      open_chunks << char
      next
    end

    expected_char = chars[open_chunks.last]

    if char != expected_char
      points += calculate_points(char)
      break
    end

    open_chunks.pop
  end
end

puts points
