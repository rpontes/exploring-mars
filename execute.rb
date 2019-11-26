require_relative './lib/mars'
require_relative './lib/probe'
require_relative './lib/explore'

mars = Mars.new(5, 5)

probe = Probe.new(1, 2, 'N')
explore = Explore.new(mars, probe, 'LMLMLMLMM')
explore.move

p 'Space Probe: 1 2 N / LMLMLMLMM'
p "Final destination: #{explore.final_coordinate}"

probe = Probe.new(3, 3, 'E')
explore = Explore.new(mars, probe, 'MMRMMRMRRM')
explore.move

p 'Space Probe: 3 3 E / MMRMMRMRRM'
p "Final destination: #{explore.final_coordinate}"
