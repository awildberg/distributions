require "../distributions/probability_distribution"
# This class provides an object for encapsulating uniform distributions
module Crystalstats
  class UniformDistribution < Crystalstats::ProbabilityDistribution
    include Crystalstats::SpecialMath

    # Constructs a uniform distribution (defaults to zero lower and
    # unity upper bound).

    @lower : Float64
    @upper : Float64
    @pdf_denominator : Float64

    def initialize(lower=0.0, upper=1.0)
      lower,upper = upper,lower if lower > upper
      @lower = lower.to_f
      @upper = upper.to_f
      @pdf_denominator = 1.0 / (@upper - @lower)
    end

    # Returns the mean of the distribution
    def get_mean 
      return 0.5*(@lower + @upper)
    end

    # Returns the standard deviation of the distribution
    def get_standard_deviation
      return Math.sqrt(get_variance)
    end

    # Returns the variance of the distribution
    def get_variance
      return 1.0/12.0 * (@upper-@lower)**2
    end


    # Obtain single PDF value
    # Returns the probability that a stochastic variable x has the value X,
    # i.e. P(x=X)
    private def get_pdf(x)
      if x >= @lower && x <= @upper
        @pdf_denominator
      else 
        0.0
      end	  
    end

    # Obtain single CDF value
    # Returns the probability that a stochastic variable x is less than X,
    # i.e. P(x<X)
    private def get_cdf(x)
      if x >= @lower && x < @upper
        (x - @lower).fdiv(@upper - @lower)
      elsif x >= @upper
        1.0
      else 
        0.0
      end	  
    end

    # Obtain single inverse CDF value.
    #	returns the value X for which P(x&lt;X).
    private def get_icdf(p)
      check_range(p)
      return @lower + p.to_f * (@upper - @lower)
    end

    # returns single random number
    private def get_rng
      return [@lower + (@upper - @lower) * rand]
    end
  end
end
