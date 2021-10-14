require "../distributions/probability_distribution"
require "../distributions/normal_distribution"
#require "matrix" 

module Crystalstats
  module MultivariateDistribution
    #override probability_distribution pdf function to work with multivariate input variables
    def pdf(x)
      get_pdf(x)
    end    
  end
  class MultivariateNormalDistribution < Crystalstats::ProbabilityDistribution
    include Crystalstats::NumericalConstants
    include Crystalstats::MultivariateDistribution
    
    def initialize(mu=[0.0,0.0],sigma=[[1.0,0.0],[0.0,1.0]])       
      raise "dimensions of mu vector and sigma matrix doesn't match" if mu.size != sigma.size
      sigma.each{|row| raise "row dim of sigma does not match mu vector" if row.size != mu.size }
      
      mu_f = mu.select{|x| x.to_f }
      sigma_f = sigma.select{|row| row.select{|x| x.to_f}}
      
      #@mu = Vector.elements(mu_f)
      #@sigma = Matrix.rows(sigma_f)      
      #u, d, u_inv = @sigma.eigensystem
      #@sigma_inv = u * (1/d) * u_inv      
      #@a = u * (d)**(0.5)
      
      #@pdf_factor = 1.0 / Math.sqrt((TWO_PI * @sigma).determinant.to_f)
      #@stdnorm = Crystalstats::NormalDistribution.new(0.0,1.0)
      raise "Matrix not yet implemented in #{self.class}"
    end


    private def get_mean 
      @mu.to_a
    end

    private def get_variance 
      raise "variance for multivariate normal distribution not implemented"
    end

    # Private method to obtain single PDF value.
    # x should be greater than 0  
    # returns the probability that a stochastic variable x has the value X, i.e. P(x=X). 
    private def get_pdf(x) 
      d = Vector.elements(x) - @mu
      @pdf_factor * Math.exp(-0.5 * d.inner_product(@sigma_inv*d).to_f)
    end

    # Private method to obtain single CDF value.
    # param x should be greater than 0    
    # return the probability that a stochastic variable x is less then X, i.e. P(x<X).
    private def get_cdf(x)
      raise "cdf for multivariate normal distribution not implemented"
    end

    # Private method to obtain single inverse CDF value.
    # return the value X for which P(x<X).
    private def get_icdf(p) 
      check_range(p)
      raise "inverse cdf for multivariate normal distribution not implemented"
    end

    # Private method to obtain single RNG value.
    private def get_rng   
      z = Vector.elements(@mu.collect{ @stdnorm.rng })
      (@mu + @a * z).to_a
    end

  end
end
