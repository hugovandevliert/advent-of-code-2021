input = File.read('input/day_14')
polymer, rules = input.split("\n\n")
rules = rules.split("\n").map { |l| l.split(' -> ') }.to_h

def apply_rules(polymer, rules, steps:)
  steps.times do
    chars_to_insert = []

    (polymer.size - 1).times do |i|
      current_chars = polymer[i] + polymer[i + 1]
      char_to_insert = rules[current_chars]

      if char_to_insert
        chars_to_insert << [char_to_insert, i + 1]
      end
    end

    offset = 0
    chars_to_insert.each do |char, i|
      polymer.insert(i + offset, char)
      offset += 1
    end
  end

  polymer
end

apply_rules(polymer, rules, steps: 10)

min, max = polymer.chars.tally.values.minmax
puts max - min
