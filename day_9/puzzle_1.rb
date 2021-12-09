input = File.read('input/day_9').split("\n")
digits = input.map { |line| line.chars.map(&:to_i) }

risk_levels = []

digits.length.times do |l|
  digits.first.length.times do |n|
    number = digits[l][n]

    adjacent_numbers = [
      digits.dig(l + 1, n),
      digits.dig(l, n + 1),
      (digits.dig(l - 1, n) unless l == 0),
      (digits.dig(l, n - 1) unless n == 0)
    ].compact

    next if adjacent_numbers.any? { |a| a <= number }

    risk_levels << number + 1
  end
end

puts risk_levels.sum
