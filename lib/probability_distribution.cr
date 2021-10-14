require "../lib/modules"

module Crystalstats
  # The ProbabilityDistribution superclass provides an object 
  # for encapsulating probability distributions.
  # 
  # Author: Jaco van Kooten 
  # Author: Mark Hale 
  # Author: Paul Meagher 
  # Author: Jesus Castagnetto 
  # Author: Bryan Donovan (port from PHPmath to Ruby) 
  
  class ProbabilityDistribution
    include Crystalstats::NumericalConstants
    include Crystalstats::SpecialMath
    include Crystalstats::ExtraMath

    def initialize
    end

    #returns the distribution mean
    def mean
      get_mean
    end

    #returns distribution variance
    def variance
      get_variance
    end

    #Probability density function 
    def pdf(y : Int32)
      return get_pdf(y)
    end

    def pdf(x : Float64) 
      #if x.is_a? Array
      #  pdf_vals = [] of Int32 | Float64
      #  (0...x.size).each do |i|
      #    pdf_vals << get_pdf(x[i])
      #  end
      #  return pdf_vals
      #else
      #  return get_pdf(x)
      #end
      return get_pdf(x)
    end

    def pdf(a : Array(Int32 | Float64))
      pdf_vals = [] of Int32 | Float64
      (0...a.size).each do |i|
        pdf_vals << get_pdf(a[i])
      end
      return pdf_vals
    end

    #Cummulative distribution function
    def cdf(x)
      if x.is_a? Array
        cdf_vals = [] of Int32 | Float64
        (0...x.size).each do |i|
          cdf_vals << get_cdf(x[i])
        end
        return cdf_vals
      else
        return get_cdf(x)
      end
    end

    #Inverse CDF
    def icdf(p)
      if p.is_a? Array
        inv_vals = [] of Int32 | Float64
        (0...p.size).each do |i|
          inv_vals << get_icdf(p[i])
        end
        return inv_vals
      else
        return get_icdf(p)
      end
    end

    #Returns random number(s) using subclass's get_rng method 
    def rng
      return get_rng()[0]
    end

    def rng(n)
      #if n < 1
      #  #return "Number of random numbers to return must be 1 or greater"
      #  raise "Number of random numbers to return must be 1 or greater"
      #end
      #if (n > 1)
      #  rnd_vals = [] of Float64
      #  (((n/2).ceil).to_i).times do |i|
      #    tmp : Array(Float64) = get_rng()
      #    rnd_vals << tmp[0]
      #    rnd_vals << tmp[1]
      #  end
      #  return rnd_vals[0..n]
      #else
      #  return get_rng()[0]
      #end
      rnd_vals = [] of Float64
      (((n/2).ceil).to_i).times do |i|
        tmp : Array(Float64) = get_rng()
        rnd_vals << tmp[0]
        rnd_vals << tmp[1]
      end
      return rnd_vals[0...n]
    end


    #private method to be implemented in subclass
    private def get_mean
    end

    #private method to be implemented in subclass
    private def get_variance
    end

    #private method to be implemented in subclass
    #returns the probability that a stochastic variable x has the value X, i.e. P(x=X). 
    private def get_pdf(x)
    end

    #private method to be implemented in subclass
    #returns the probability that a stochastic variable x is less then X, i.e. P(x&lt;X). 
    private def get_cdf(x)
    end

    #private method to be implemented in subclass
    #returns the value X for which P(x&lt;X). 
    private def get_icdf(p)
    end

    #private method to be implemented in subclass
    #Random number generator
    private def get_rng 
    end

    
    #check that variable is between lo and hi limits. 
    #lo default is 0.0 and hi default is 1.0
    def check_range(x, lo=0.0, hi=1.0)
      raise ArgumentError.new("x cannot be nil") if x.nil?
      if x < lo || x > hi
        raise ArgumentError.new("x must be greater than lo (#{lo}) and less than hi (#{hi})") 
      end
    end

    def get_factorial(n)
      if n <= 1
        return 1
      else
        return n.to_i128.downto(1).reduce { |a,i| a*i }
      end
    end

    def find_root(prob, guess, x_lo, x_hi) 
      accuracy = 1.0e-10
      max_iteration = 150
      x	= guess
      x_new = guess
      error = 0.0
      _pdf = 0.0
      dx = 1000.0
      i = 0
      while ( dx.abs > accuracy && (i += 1) < max_iteration )
        #Apply Newton-Raphson step
        #raise ArgumentError.new("fff #{x}, #{cdf(x)}")
        error = cdf(x).as(Float64) - prob
        if error < 0.0
          x_lo = x
        else
          x_hi = x
        end
        _pdf = pdf(x).as(Float64)
        if _pdf != 0.0
          dx = error / _pdf
          x_new = x - dx
        end
        # If the NR fails to converge (which for example may be the 
        # case if the initial guess is too rough) we apply a bisection
        # step to determine a more narrow interval around the root.
        if  x_new < x_lo || x_new > x_hi || _pdf == 0.0
          x_new = (x_lo + x_hi) / 2.0
          dx = x_new - x
        end
        x = x_new
      end
      return x
    end
  end
end
