input = File.read('input/day_9').split("\n")
$digits = input.map { |line| line.chars.map(&:to_i) }
$found_digits = []
$digits.length.times do
  $found_digits << []
end

def visit(i, j)
  $found_digits[i][j] = $digits[i][j]
end

def visited?(i, j)
  $found_digits[i][j] != nil
end

def find_neighbours(i, j)
  neighbours = []
  neighbours << [i + 1, j] unless i == 99
  neighbours << [i, j + 1] unless j == 99
  neighbours << [i - 1, j] unless i == 0
  neighbours << [i, j - 1] unless j == 0

  neighbours
end

def basin_size(i, j)
  visit(i, j)
  number = $digits[i][j]

  return 0 if number == 9

  neighbours = find_neighbours(i, j)
  size = 1

  while neighbours.any?
    neighbours.uniq!
    neighbours.reject! { |x, y| visited?(x, y) }
    neighbours.each { |x, y| visit(x, y) }
    neighbours.reject! { |x, y| $digits[x][y] == 9 }

    size += neighbours.count
    neighbours.each do |x, y|
      neighbours += find_neighbours(x, y)
    end
  end

  size
end

basins = []

$digits.length.times do |i|
  $digits.first.length.times do |j|
    basins << basin_size(i, j)
  end
end

puts basins.max(3).inject(:*)
