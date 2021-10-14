# distributions
loosely port of **rubystats** https://github.com/phillbaker/rubystats to crystal with bugfixes

## Installation
Find your crystal installation and the corresponding ```src``` directory:

    crystal_dir=$(ls $(which crystal))      # e.g. /Users/user/crystal/bin/crystal

Place the main file ```distributions.cr``` and the libraries ```distributions``` into the ```src``` directory:

    cp -R distributions.cr distributions ${crystal_dir%/*/*}/src/

## Usage
    require "distributions"

## available classes

**NormalDistribution<br>
BinomialDistribution<br>
BetaDistribution<br>
CauchyDistribution<br>
ExponentialDistribution<br>
FishersExactTest<br>
GammaDistribution<br>
LognormalDistribution<br>
PoissonDistribution<br>
StudentTDistribution<br>
UniformDistribution<br>
WeibullDistribution**

added after Matrix and Vector have been implemented:<br>
**MultivariateNormalDistribution**

##
### create object
    norm  = Normal.new  2.0,  5       # shortcut for "NormalDistribution.new"
    bino  = Binomial.new 2, 0.4
    beta  = Beta.new  0.1,  0.3
    cach  = Cauchy.new    2,  3
    expo  = Exponential.new
    fi    = Fisher.new
    gamma = Gamma.new
    log   = Lognormal.new
    pois  = Poisson.new 10
    st    = Student.new
    uni   = Uniform.new 0, 10
    wbull = Weibull.new
    
### probability density function
    puts norm.pdf 2.4                # 0.07953354110232176
    puts norm.pdf [3.0, 3.3]         # [0.07820853879509115, 0.0771366738383632]
    puts bino.pdf [0.2, 0.5]         # [0.4313110348439398, 0.49900595278955273]
    puts beta.pdf 0.3                # 0.29564825937025924
    puts cach.pdf 1.2                # 0.09905909321072323
    puts expo.pdf 0.3                # 0.7408182206817179
    puts gamma.pdf 0.8               # 0.44932896411722156
    puts log.pdf 0.5                 # 0.6274960771159243
    puts pois.pdf 2                  # 0.0022699964881242427
    puts st.pdf 9                    # 0.0038818278802901303
    puts uni.pdf 2.3                 # 0.1
    puts wbull.pdf 2.3               # 0.10025884372280375

### cumulative distribution function
    puts norm.cdf 2.0                # 0.5
    puts norm.cdf [2.3, 3.4]         # [0.5239221826541068, 0.6102612475557971]
    puts bino.cdf [0.5, 0.9]         # [0.36, 0.36]
    puts beta.cdf 0.9                # 0.8669336800281993
    puts cach.cdf 3.2                # 0.6211189415908435
    puts expo.cdf 1                  # 0.6321205588285577
    puts gamma.cdf 0.4               # 0.32967995396436056
    puts log.cdf 0.9                 # 0.4580448727856589
    puts pois.cdf 10                 # 0.5830397501929856
    puts st.pdf 9                    # -0.45482278617131633
    puts uni.cdf 4                   # 0.4
    puts wbull.cdf 3.2               # 0.9592377960216338
    
### inverse cumulative distribution function
    puts norm.icdf 0.6               # 3.2667355156789992
    puts norm.icdf [0.1, 0.5]        # [-4.407757827723003, 2.0]
    puts bino.icdf [0.9, 0.99]       # [2, 2]
    puts beta.icdf 0.1               # 1.2091010943344349e-9
    puts cach.icdf 0.5               # [2.0]
    puts expo.icdf 0.8               # 1.6094379124341005
    puts pois.icdf 0.999999          # 28
    puts uni.icdf 0.7                # 7.0
    puts wbull.icdf 0.9              # 2.302585092994046

### random number
    puts norm.rng 5                  # [0.989068826407212, 0.3864366469182574, -11.171031854542266, -2.382879260518245, -0.44308602711354883]
    puts bino.rng                    # 1.0
    puts beta.rng                    # 0.005458760405001688
    puts cach.rng                    # 12.123106697726463
    puts expo.rng                    # 0.8030553422389787
    puts gamma.rng                   # 0.31707382996802885
    puts log.rng                     # 0.6366757373839796
    puts pois.rng                    # 14
    puts st.rng                      # -0.6552081722716109
    puts uni.rng                     # 5.656073592265938
    puts wbull.rng                   # 0.2298211759745445
    
### fishers exact test
    puts fi.exact 2.3, 4.2, 1.3, 5.3 # 0.4389521037471969
