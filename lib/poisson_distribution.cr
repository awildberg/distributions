require "probability_distribution"

module Crystalstats
  class PoissonDistribution < Crystalstats::ProbabilityDistribution 
    include Crystalstats::MakeDiscrete

    # Constructs a Poisson distribution
    @rate : Float64
    def initialize(rate)
      if rate <= 0.0
        raise ArgumentError.new("The rate for the Poisson distribution should be greater than zero.")
      end
      @rate = rate.to_f
    end

    #returns the mean
    def get_mean
      @rate
    end

    #returns the variance
    def get_variance
      @rate
    end

    # Private methods below


    # Probability mass function of a Poisson distribution .
    # k should be an integer
    # returns the probability that a stochastic variable x has the value k,
    # i.e. P(x = k)
    private def get_pdf(k)
      raise ArgumentError.new("Poisson pdf: k needs to be >= 0") if k < 0
      (@rate**k) * Math.exp(-@rate) / get_factorial(k).to_f
    end

    # Private shared function for getting cumulant for particular x
    # param k should be integer-valued
    # returns the probability that a stochastic variable x is less than _x
    # i.e P(x < k)
    private def get_cdf(k)
      raise ArgumentError.new("Poisson pdf: k needs to be >= 0") if k < 0
      sum = 0.0
      (0..k).each do |i| 
        sum += get_pdf(i)
      end
      return sum
    end

    # Inverse of the cumulative Poisson distribution function 
    private def get_icdf(prob)
      check_range(prob)
      sum = 0.0
      k = 0
      until prob <= sum 
        sum += get_pdf(k)
        k += 1
      end 
      return k - 1
    end

    # Private Poisson RNG function
    # Poisson generator based upon the inversion by sequential search
    private def get_rng
      x = 0
      p = Math.exp(-@rate)
      s = p
      u = rand
      while u > s
        x += 1
        p *= @rate / x.to_f
        s += p
      end
      [x]
    end
  end
end
