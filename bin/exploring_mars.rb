#!/usr/bin/env ruby

require_relative "../lib/mars"
require_relative "../lib/probe"
require_relative "../lib/explore"

def send_space_probe(mars, probe, instructions)
  explore = Explore.new(mars, probe, instructions)
  explore.move

  puts "=============================================="
  puts "The Space Probe arrived at destination!!!"
  puts "Final destination: #{explore.final_coordinate}"
  puts "=============================================="
rescue Moves::OutOfEdge => e
  puts "**************** WARNING *********************"
  puts e.message
  puts "Last position: #{explore.final_coordinate}"
  puts "**************** WARNING *********************"
end

print "Do you want execute the examples? (Y/n) "
answer = STDIN.readline.strip

if answer.upcase != "N"
  mars = Mars.new(5, 5)

  probe = Probe.new(1, 2, "N")
  puts "Space Probe: 1 2 N / LMLMLMLMM"
  send_space_probe(mars, probe, "LMLMLMLMM")

  probe = Probe.new(3, 3, "E")
  puts "Space Probe: 3 3 E / MMRMMRMRRM"
  send_space_probe(mars, probe, "MMRMMRMRRM")
else
  begin
    puts "What is the most northeast point of Mars? ex: (5 5) "
    input = STDIN.readline.strip

    x_axis, y_axis = *input.split(" ")

    mars = Mars.new(x_axis, y_axis)

    puts "Let's launch our Space Probes!!!"

    loop do
      puts "Space Probe start position? ex: (1 2 N) "
      input = STDIN.readline.strip

      x_axis, y_axis, cardinal_direction = *input.split(" ")

      probe = Probe.new(x_axis, y_axis, cardinal_direction.upcase)

      puts "Move instructions? ex: (LMLMLMLMM) "
      instructions = STDIN.readline.strip

      send_space_probe(mars, probe, instructions.upcase)

      puts "Would you like to launch another Probe? "
      answer = STDIN.readline.strip

      break if answer.upcase != "Y"
    end
  rescue ArgumentError => e
    puts "**************** WARNING *********************"
    puts e.message
    puts "**************** WARNING *********************"
  end
end
