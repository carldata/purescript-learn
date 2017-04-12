module Statistics.Sample 
  ( Sample
  , mean
  , stddev
  , variance
  ) where

import Prelude 
import Data.Array as A
import Data.Foldable (sum)
import Data.Int (toNumber)
import Math (pow, sqrt)


-- | Sample data  
type Sample = Array Number  


-- Calculate mean
mean :: Sample -> Number
mean xs = sum xs / toNumber (A.length xs)


-- Calculate variance
variance :: Sample -> Number
variance xs = sum (map (\v -> pow (v-mu) 2.0) xs) / toNumber (A.length xs)
  where 
    mu = mean xs


-- Calculate standard deviation
stddev :: Sample -> Number
stddev = sqrt <<< variance
