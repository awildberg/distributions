require "../distributions/probability_distribution"
# This class provides an object for encapsulating exponential distributions
# Ported to Ruby from PHPMath class by Bryan Donovan
# Author:: Mark Hale
# Author:: Paul Meagher
# Author:: Bryan Donovan (http://www.bryandonovan.com)
module Crystalstats
  class ExponentialDistribution < Crystalstats::ProbabilityDistribution
    include Crystalstats::NumericalConstants
    include Crystalstats::SpecialMath
    include Crystalstats::ExtraMath

    @decay : Float64 = 0.0
    @rate : Float64

    def initialize(decay=1.0) 
      if decay < 0.0
        raise ArgumentError.new("Decay parameter should be positive.")
      end
      @rate = decay.to_f
    end

    private def get_mean 
      @rate
    end

    private def get_variance 
      @rate * @rate
    end

    # Private method to obtain single PDF value.
    # x should be greater than 0  
    # returns the probability that a stochastic variable x has the value X, i.e. P(x=X). 
    private def get_pdf(x) 
      check_range(x, 0.0, MAX_VALUE)
      @rate * Math.exp(-1 * @rate * x)
    end

    # Private method to obtain single CDF value.
    # param x should be greater than 0    
    # return the probability that a stochastic variable x is less then X, i.e. P(x<X).
    private def get_cdf(x)
      check_range(x,0.0,MAX_VALUE)
      1.0 - Math.exp(-1 * @rate * x)    
    end

    # Private method to obtain single inverse CDF value.
    # return the value X for which P(x<X).
    private def get_icdf(p) 
      check_range(p)
      -1 * Math.log(1.0 - p) / @rate
    end

    # Private method to obtain single RNG value.
    # return exponential random deviate
    private def get_rng   
      [-(Math.log(rand) / @rate)]
    end

  end
end
