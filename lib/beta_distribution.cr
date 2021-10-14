require "../lib/probability_distribution"

module Crystalstats
  class BetaDistribution < Crystalstats::ProbabilityDistribution 
    include Crystalstats::SpecialMath

    property :p, :q

    #dgr_p = degrees of freedom p
    #dgr_q = degrees of freedom q
    def initialize(dgr_p : Float64, dgr_q : Float64)
      if dgr_p <= 0 || dgr_q <= 0
        raise ArgumentError.new("Paramters must be greater than zero.")
      end
      @p = dgr_p
      @q = dgr_q
    end

    def mean
      @p.to_f / (@p.to_f + @q.to_f)
    end

    def standard_deviation
      Math.sqrt(@p * @q / ((@p + @q)**2 * (@p + @q + 1)))
    end

    def pdf(x) 
      if x.is_a? Array 
        pdf_vals = [] of Int32 | Float64
        (0...x.size).each do |i| 
          check_range(x[i])
          if x[i] == 0.0 || x[i] == 1.0 
            pdf_vals[i] = 0.0
          else 
            pdf_vals << Math.exp( - log_beta(@p, @q) + (@p - 1.0) * Math.log(x[i]) + (@q - 1.0) * Math.log(1.0 - x[i]))
          end
        end
        return pdf_vals
      else 
        check_range(x)
        if  (x == 0.0) || (x == 1.0)  
          return 0.0
        else 
          return Math.exp( -1.0 * log_beta(@p, @q) + 
          (@p - 1.0) * Math.log(x) + 
          (@q - 1.0) * Math.log(1.0 - x))
        end
      end
    end

    def cdf(x) 
      if x.is_a? Array 
        cdf_vals = Array(Int32 | Float64).new
        (0...x.size).each do |i| 
          check_range(x[i])
          cdf_vals << incomplete_beta(x[i], @p, @q)
        end
        return cdf_vals
      else 
        check_range(x)
        cdf_val = incomplete_beta(x, @p, @q)
        return cdf_val
      end
    end

    def icdf(prob) 
      if prob.is_a? Array 
        inv_vals = Array(Int32 | Float64).new
        (0...prob.size).each do |i|
          check_range(prob[i])
          if prob[i] == 0.0 
            inv_vals[i] = 0.0
          end
          if prob[i] == 1.0
            inv_vals[i] = 1.0
          end
          inv_vals << find_root(prob[i], 0.5, 0.0, 1.0)
        end
        return inv_vals
      else 
        check_range(prob)
        return 0.0 if prob == 0.0
        return 1.0 if prob == 1.0
        return find_root(prob, 0.5, 0.0, 1.0)
      end
    end

    def rng
      self.icdf(rand)
    end
	
  end
end
