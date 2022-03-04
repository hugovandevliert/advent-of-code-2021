input = File.read('input/day_14')
polymer, rules = input.split("\n\n")
rules = rules.split("\n").map { |l| l.split(' -> ') }.to_h

def apply_rules(polymer, rules, steps:)
  combinations = polymer.chars.each_cons(2).tally

  steps.times do
    new_combinations = {}
    new_combinations.default = 0

    combinations.each do |chars, n|
      char_to_insert = rules[chars.join]

      if char_to_insert
        new_combinations[[chars.first, char_to_insert]] += n
        new_combinations[[char_to_insert, chars.last]] += n
      end
    end

    combinations = new_combinations
  end

  combinations
end

combinations = apply_rules(polymer, rules, steps: 40)

totals = {}
totals.default = 0
combinations.each { |chars, n| totals[chars.first] += n }
totals[polymer.chars.last] += 1

min, max = totals.values.minmax
puts max - min
