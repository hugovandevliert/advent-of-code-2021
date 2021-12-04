# this solution is stupid

input = File.read('input/day_4').split("\n")

numbers = input.first.split(',').map(&:to_i)
bingo_boards = input.drop(1).each_slice(6).map { |b| b.drop(1) }

def board_wins?(bingo_board, numbers)
  rows = bingo_board.map { |r| r.split.map(&:to_i) }
  cols = rows.transpose

  rows.each do |row|
    return true if row.reject { |n| numbers.include? n }.empty?
  end

  cols.each do |col|
    return true if col.reject { |n| numbers.include? n }.empty?
  end

  false
end

def calculate_score(bingo_board, numbers)
  rows = bingo_board.map { |r| r.split.map(&:to_i) }
  unmarked_numbers = rows.flatten.reject { |n| numbers.include? n }

  unmarked_numbers.sum * numbers.last
end

def winning_board(bingo_boards, numbers)
  wincount = 0

  numbers.count.times do |i|
    numbers_so_far = numbers.first(i + 1)

    bingo_boards.each do |board|
      next unless board_wins?(board, numbers_so_far)

      wincount += 1
      bingo_boards.delete(board)
      return calculate_score(board, numbers_so_far) if wincount == 100
    end
  end
end

puts winning_board(bingo_boards, numbers)
