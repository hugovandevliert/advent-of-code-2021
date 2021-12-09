input = File
  .read('input/day_8')
  .split("\n")
  .map { |l| l[/\|.*/] }
  .map { |l| l[2..-1] }
  .map(&:split)
  .flatten
  .map { |s| s.length }

puts input.count { |n| [2, 3, 4, 7].include? n }
