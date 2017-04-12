-- The normal distribution.  This is a continuous probability
-- distribution that describes data that cluster around a mean.
-- Ported from Haskell statistics package

module Statistics.Distribution.Normal
    ( NormalDistribution
    -- * Constructors
    , standard
    ) where

-- import Control.Applicative
-- import Data.Aeson            (FromJSON(..), ToJSON, Value(..), (.:))
-- import Data.Binary           (Binary(..))
-- import Data.Data             (Data, Typeable)
-- import GHC.Generics          (Generic)
-- import Numeric.MathFunctions.Constants (m_sqrt_2, m_sqrt_2_pi)
-- import Numeric.SpecFunctions (erfc, invErfc)
-- import qualified System.Random.MWC.Distributions as MWC
-- import qualified Data.Vector.Generic as G

-- import qualified Statistics.Distribution as D
-- import qualified Statistics.Sample as S
-- import Statistics.Internal


-- | The normal distribution.
type NormalDistribution = 
  { mean       :: Number
  , stdDev     :: Number
  } --deriving (Eq, Typeable, Data, Generic)


-- | Standard normal distribution with mean equal to 0 and variance equal to 1
standard :: NormalDistribution
standard = { mean: 0.0, stdDev: 1.0 }