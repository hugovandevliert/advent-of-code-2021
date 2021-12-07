input = File.read('input/day_7').split(',').map(&:to_i)

diffs = []
min, max = input.minmax

(min..max).each do |median|
  diff = input.map do |crab|
    dist = (crab - median).abs
    dist * (dist + 1) / 2
  end

  diffs << diff.sum
end

puts diffs.min
