# Exploring Mars
On this project we will land Spaces Probes on the surface of mars. To control we need send coordinates and commands to each probe to land safely.

## The Commands

You need send the commands as follows:

**The limit point to the northwest**
```ruby
# x axis | y axis
5 5
```

**Space Probe start position**
```ruby
# x axis | y axis | cardinal point direction
1 2 N
```

**Moving instructions**
```ruby
# L = left | R = right | M = move
LMLMLMLMM
```
It's import know that when you send the `L` or `R` command the Probe rotates 90 degrees changin the cardinal point direction not performing forward motion, for this it is necessary to send the command `M` for the probe to change the quadrant.


## Space Probe Response

When the Space Probe lands it sends a signal informing the arrival coordinates:

```ruby
# X axis | Y axis | cardinal point direction
1 3 N
```

## Execution

```
git clone git@github.com:rpontes/exploring-mars.git

cd exploring-mars

ruby execute.rb
```
