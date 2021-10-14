require "./distributions/normal_distribution"
require "./distributions/binomial_distribution"
require "./distributions/poisson_distribution"
require "./distributions/beta_distribution"
require "./distributions/fishers_exact_test"
require "./distributions/exponential_distribution"
require "./distributions/uniform_distribution"
require "./distributions/lognormal_distribution"
require "./distributions/student_t_distribution"
require "./distributions/weibull_distribution"
require "./distributions/cauchy_distribution"
require "./distributions/gamma_distribution"
require "./distributions/multivariate_normal_distribution"
require "./distributions/version"

module Crystalstats
end

NormalDistribution = Crystalstats::NormalDistribution
BinomialDistribution = Crystalstats::BinomialDistribution
PoissonDistribution = Crystalstats::PoissonDistribution
BetaDistribution = Crystalstats::BetaDistribution
FishersExactTest = Crystalstats::FishersExactTest
ExponentialDistribution = Crystalstats::ExponentialDistribution
UniformDistribution = Crystalstats::UniformDistribution
LognormalDistribution = Crystalstats::LognormalDistribution
StudentTDistribution = Crystalstats::StudentTDistribution
WeibullDistribution = Crystalstats::WeibullDistribution
CauchyDistribution = Crystalstats::CauchyDistribution
GammaDistribution = Crystalstats::GammaDistribution
MultivariateNormalDistribution = Crystalstats::MultivariateNormalDistribution

#short-hand notation
Normal = Crystalstats::NormalDistribution
Binomial = Crystalstats::BinomialDistribution
Poisson = Crystalstats::PoissonDistribution
Beta = Crystalstats::BetaDistribution
Fisher = Crystalstats::FishersExactTest
Exponential = Crystalstats::ExponentialDistribution
Uniform = Crystalstats::UniformDistribution
Lognormal = Crystalstats::LognormalDistribution
Student = Crystalstats::StudentTDistribution
Weibull = Crystalstats::WeibullDistribution
Cauchy = Crystalstats::CauchyDistribution
Gamma = Crystalstats::GammaDistribution
MultivariateNormal = Crystalstats::MultivariateNormalDistribution
