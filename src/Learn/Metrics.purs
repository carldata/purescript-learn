module Learn.Metrics (mse) where 

import Prelude
import Data.Array as A 
import Data.Int (toNumber)
import Data.Maybe (fromMaybe)
import Math (pow)

import Learn.Math.Vector as V


-- | Calculate Mean Square Error
-- | https://en.wikipedia.org/wiki/Mean_squared_error
-- | 
mse :: V.Vector Number -> V.Vector Number -> Number
mse xs ys = if n == 0 then 0.0 else (V.sum vs' / toNumber n)
    where 
        vs = map (\v -> pow v 2.0) <$> V.diff xs ys        
        vs' = fromMaybe [] vs
        n = A.length vs'


