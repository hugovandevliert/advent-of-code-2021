input = File.read('input/day_13')
coordinates, folds = input.split("\n\n").map { |l| l.split("\n") }
coordinates = coordinates.map { |l| l.split(',').map(&:to_i) }
highest_x, highest_y = coordinates.transpose.map(&:max)

grid = Array.new(highest_x + 1, 0) { Array.new(highest_y + 1, 0) }
coordinates.each do |x, y|
  grid[y][x] = 1
end

def fold_grid(grid, fold)
  dir, line = fold.delete_prefix('fold along ').split('=')

  case dir
  when 'x' then fold_grid_up(grid, line.to_i)
  when 'y' then fold_grid_left(grid, line.to_i)
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
  top = grid.map { |y| y.take(line) }
  bottom = grid.map { |y| y.drop(line) }

  bottom.each_with_index do |y, i|
    y.drop(1).each_with_index do |v, j|
      next unless v == 1

      top[i][j * -1 - 1] = 1
    end
  end

  top
end

folded_grid = grid.dup
folds.each do |fold|
  folded_grid = fold_grid(folded_grid, fold)
end

folded_grid.each {|row| row.each {|col| print col == 1 ? '#' : ' ' }; print "\n" }
