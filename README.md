# crystalstats
loosely port of rubystats to crystal

## Usage
    require "crystalstats"

## available classes

**NormalDistribution**<br>
**BinomialDistribution**

more added in the next days

### create object
    norm = Normal.new 2.0, 10.0    # shortcut for "NormalDistribution.new"

### probability density function
    puts norm.pdf 2.4              # Float64
    puts norm.pdf [2.1, 3.9, 10.4] # Array(Float64)

### cumulative distribution function
    puts norm.cdf 2.0              # Float64
    puts norm.cdf [3.4, 4.5]       # Array(Float64)
    
### inverse cumulative distribution function
    puts norm.icdf 0.6             # Float64

### random number
    puts norm.rng 100              # Array(Float64) size 100
