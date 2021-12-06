input = File.read('input/day_6').split(',').map(&:to_i)

fish = input

80.times do
  fish.count.times do |i|
    if fish[i] > 0
      fish[i] -= 1
    else
      fish[i] = 6
      fish.append(8)
    end
  end
end

puts fish.count
