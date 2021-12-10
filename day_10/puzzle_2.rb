input = File.read('input/day_10').split("\n")

def calculate_points(char)
  case char
    when '(' then 1
    when '[' then 2
    when '{' then 3
    when '<' then 4
  end
end

chars = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
  '<' => '>'
}
points = []

input.each do |line|
  open_chunks = []
  corrupted = false

  line.chars.each do |char|
    if chars.keys.include? char
      open_chunks << char
      next
    end

    if char != chars[open_chunks.last]
      corrupted = true
      break
    end

    open_chunks.pop
  end

  next if corrupted

  chunk_points = 0
  open_chunks.reverse.each do |c|
    chunk_points *= 5
    chunk_points += calculate_points(c)
  end

  points << chunk_points
end

puts points.sort[points.size / 2]
