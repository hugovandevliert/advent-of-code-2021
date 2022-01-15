input = File.read('input/day_8').split("\n").map { |l| l.split(' | ') }

def sorted(string)
  string.chars.sort.join
end

def in_pattern?(pattern, string)
  string.chars.all? { |c| pattern.chars.include?(c) }
end

outputs = input.map do |pattern, output|
  patterns = pattern.split

  one = patterns.delete(patterns.find { |p| p.length == 2 })
  four = patterns.delete(patterns.find { |p| p.length == 4 })
  seven = patterns.delete(patterns.find { |p| p.length == 3 })
  eight = patterns.delete(patterns.find { |p| p.length == 7 })
  three = patterns.delete(patterns.select { |p| p.length == 5 }.find { |p| in_pattern?(p, one) })
  nine = patterns.delete(patterns.find { |p| in_pattern?(p, three + four) })
  five = patterns.delete(patterns.find { |p| in_pattern?(nine, p) })
  two = patterns.delete(patterns.find { |p| p.length == 5 })
  six = patterns.delete(patterns.find { |p| in_pattern?(p, five) })
  zero = patterns.last

  mapping = [zero, one, two, three, four, five, six, seven, eight, nine].map { |s| sorted(s) }

  output.split.map { |o| mapping.find_index(sorted(o)) }.join.to_i
end

puts outputs.sum
