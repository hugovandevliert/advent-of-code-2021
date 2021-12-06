input = File.read('input/day_5').split("\n")

counts = {}

def range_for(a, b)
  min = [a, b].min
  min == a ? (a..b).to_a : a.downto(b).to_a
end

def increment_point_count(counts, point)
  key = point.join(',')

  if counts[key].nil?
    counts[key] = 1
  else
    counts[key] += 1
  end
end

input.each do |line|
  a, b = line.split(' -> ')
  x1, y1 = a.split(',').map(&:to_i)
  x2, y2 = b.split(',').map(&:to_i)

  xs = range_for(x1, x2)
  ys = range_for(y1, y2)

  xs *= ys.length if xs.length == 1
  ys *= xs.length if ys.length == 1

  xs.zip(ys).each do |x, y|
    increment_point_count(counts, [x, y])
  end
end

puts counts.values.tally.except(1).values.sum
