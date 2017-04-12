-- The normal distribution.  This is a continuous probability
-- distribution that describes data that cluster around a mean.
-- Ported from Haskell statistics package

module Statistics.Distribution.Normal
    ( NormalDistribution
    -- * Constructors
    , normalDistr
    , fromSample
    , standard
    ) where

import Prelude
import Statistics.Sample as S 


-- | The normal distribution.
data NormalDistribution = ND 
  { mean       :: Number
  , stdDev     :: Number
  }

-- Show instance
instance showNornalDistribution :: Show NormalDistribution where
  show (ND {mean: mu, stdDev: sd}) = "Normal distribution: {mean: " <> show mu <> ", stddev: " <> show sd <> "}"

-- Equality instance
instance eqNornalDistribution :: Eq NormalDistribution where
  eq (ND {mean: m1, stdDev: s1}) (ND {mean: m2, stdDev: s2}) = m1 == m2 && s1 == s2


-- | Create normal distribution from mean and standard deviation
normalDistr :: Number -> Number -> NormalDistribution
normalDistr mu sd = ND { mean: mu, stdDev: sd }


-- | Standard normal distribution with mean equal to 0 and variance equal to 1
standard :: NormalDistribution
standard = normalDistr 0.0 1.0


-- | Create distribution using parameters estimated from
-- | sample. Variance is estimated using maximum likelihood method
-- | (biased estimation).
fromSample :: S.Sample -> NormalDistribution
fromSample xs = normalDistr mu sd
  where
    mu = S.mean xs
    sd = S.stddev xs