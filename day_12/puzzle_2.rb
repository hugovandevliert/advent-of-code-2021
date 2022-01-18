input = File
  .read('input/day_12')
  .split("\n")
  .map { |l| l.split('-') }

input += input.map { |a, b| [b, a] }
paths = input.uniq.reject { |_, b| b == 'start' }

def walk(route, paths, routes = [])
  if route.last == 'end'
    routes << route
    return routes
  end

  options = paths.select { |a, _| a == route.last }
  visited_small_caves = route.select { |c| c.downcase == c }
  if visited_small_caves.tally.any? { |_, v| v > 1 }
    options.reject! { |_, b| b.downcase == b && route.include?(b) }
  end

  return routes if options.empty?

  options.each do |_, b|
    walk(route + [b], paths, routes)
  end

  routes
end

routes = walk(['start'], paths)
puts routes.count
