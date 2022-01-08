input = File.read('input/day_11').split("\n")

class Octopus
  attr_reader :energy_level, :flashed, :i, :j

  def initialize(energy_level, i, j)
    @energy_level = energy_level.to_i
    @flashed = false
    @i = i
    @j = j
  end

  def neighbours
    [
      ($octopi.dig(@i + 1, @j) unless @i == 9),
      ($octopi.dig(@i, @j + 1) unless @j == 9),
      ($octopi.dig(@i - 1, @j) unless @i == 0),
      ($octopi.dig(@i, @j - 1) unless @j == 0),
      ($octopi.dig(@i - 1, @j - 1) unless @i == 0 || @j == 0),
      ($octopi.dig(@i - 1, @j + 1) unless @i == 0 || @j == 9),
      ($octopi.dig(@i + 1, @j + 1) unless @j == 9 || @i == 9),
      ($octopi.dig(@i + 1, @j - 1) unless @j == 0 || @i == 9)
    ].compact
  end

  def reset
    @energy_level = 0 if flashed?
    @flashed = false
  end

  def increment
    @energy_level += 1
  end

  def flash
    @flashed = true
    $flashes += 1

    neighbours.each(&:increment)
    neighbours.each(&:maybe_flash)
  end

  def maybe_flash
    return if @energy_level <= 9
    return if flashed?

    flash
  end

  def flashed?
    @flashed
  end
end

$flashes = 0
$octopi = input.each_with_index.map do |l, i|
  l.chars.each_with_index.map do |n, j|
    Octopus.new(n, i, j)
  end
end

100.times do |i|
  $octopi.each { |l| l.each { |o| o.increment } }
  $octopi.each { |l| l.each { |o| o.maybe_flash } }
  $octopi.each { |l| l.each { |o| o.reset } }
end

puts $flashes
