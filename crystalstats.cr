require "./lib/normal_distribution"
require "./lib/binomial_distribution"
require "./lib/poisson_distribution"
require "./lib/beta_distribution"
require "./lib/fishers_exact_test"
require "./lib/exponential_distribution"
require "./lib/uniform_distribution"
require "./lib/lognormal_distribution"
require "./lib/student_t_distribution"
require "./lib/weibull_distribution"
require "./lib/cauchy_distribution"
require "./lib/gamma_distribution"
require "./lib/multivariate_normal_distribution"
require "./lib/version"

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
