# Exploring Mars
On this project we will land Spaces Probes on the surface of Mars. In order to ensure a sefely landing and surface operation, a Probe needs to be loaded with its touchdown coordinates and an exploration program using a specific instruction set.

## Instruction Set

A limited instruction set capable of describe the exploration area, probe positioning and bearing, and movement commands is available:

**Exploration Area**
```ruby
# x axis | y axis
5 5
```

**Probe Position and bearing**
```ruby
# x axis | y axis | direction
1 2 N
```

**Moving instructions**
```ruby
# L = left | R = right | M = move
LMLMLMLMM
```
Notice when issuing an orientation command (`L` and `R`), the probe will only rotates 90 degrees and no movement is applied. In order to actually move the probe, a `M` command must be issued.

## Space Probe Arrival

When the Space Probe lands, it sends a signal informing the arrival coordinates:

```ruby
# X axis | Y axis | direction
1 3 N
```

If the Space Probe reaches on the limit of area, a message will be sent:

```
Houston, we have a problem. We reached our limit.
```


## Running
To run you need the Ruby installed, you can follow the instructions: [Installing Ruby](https://www.ruby-lang.org/en/documentation/installation/)

```
git clone git@github.com:rpontes/exploring-mars.git

cd exploring-mars

ruby bin/exploring_mars.rb
```
