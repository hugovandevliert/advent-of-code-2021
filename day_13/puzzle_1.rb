input = File.read('input/day_13')
coordinates, folds = input.split("\n\n").map { |l| l.split("\n") }
coordinates = coordinates.map { |l| l.split(',').map(&:to_i) }
highest_x, highest_y = coordinates.transpose.map(&:max)

grid = Array.new(highest_x + 1) { Array.new(highest_y + 1) }
coordinates.each do |x, y|
  grid[x][y] = 1
end

def fold_grid(grid, fold)
  dir, line = fold.delete_prefix('fold along ').split('=')

  case dir
  when 'x' then fold_grid_left(grid, line.to_i)
  when 'y' then fold_grid_up(grid, line.to_i)
  end
end

def fold_grid_left(grid, line)
  left = grid.take(line)
  right = grid.drop(line)

  right.drop(1).each_with_index do |y, i|
    y.each_with_index do |v, j|
      next unless v == 1

      left[i * -1 - 1][j] = 1
    end
  end

  left
end

def fold_grid_up(grid, line)
  raise 'not implemented'
end

def count_dots(grid)
  grid.map { |x| x.count { |y| y == 1 } }.sum
end

folded_grid = fold_grid(grid, folds.first)
puts count_dots(folded_grid)
