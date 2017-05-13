module Learn.Supervised.LinearRegression 
  ( Model
  , coefficients
  , predict
  , predict1
  , train
  ) where 


import Prelude
import Data.Array as A 
import Data.Int (toNumber)
import Data.Maybe (fromMaybe)

import LinearAlgebra.Matrix as M 
import LinearAlgebra.Vector as V


-- Helper types 
type Vector = V.Vector Number 
type Matrix = M.Matrix Number 

data Model = Model Vector

instance showModel :: Show Model where 
  show (Model xs) = "Model coefficients: " <> show xs

-- | Get model coefficients
coefficients :: Model -> Vector
coefficients (Model cs) = cs 


-- | Train model using gradient descent
train :: Matrix     -- ^ Train data
      -> Vector     -- ^ Target values
      -> Model      -- ^ Trained model
train xs y = Model $ gradientDescent initCoef 1000 (M.insertCol 0 b xs) y
  where 
    initCoef = A.replicate (M.ncols xs + 1) 1.0
    b = A.replicate (M.nrows xs) 1.0


-- | Predict values based on trained model      
predict :: Model -> Matrix-> Vector
predict model mat = map (predict1 model) $ M.rows mat

-- | Predict value for a single sample
predict1 :: Model -> Vector -> Number
predict1 (Model cs) x = fromMaybe 0.0 $ V.dot cs (A.cons 1.0 x)

-- ----------------------------------------------------------------------------
-- Gradient descent
-- ----------------------------------------------------------------------------

-- Learning rate
alpha :: Number
alpha = 0.1

-- Learn model coefficients using gradient descent algorithm
gradientDescent :: Vector   -- ^ Model coefficients
                -> Int      -- ^ Number of steps
                -> Matrix   -- ^ Train data
                -> Vector   -- ^ Labels 
                -> Vector   -- ^ Trained model coefficients
gradientDescent cs steps xs y = if steps <= 1
                                then cs' 
                                else gradientDescent cs' (steps-1) xs y
  where
    hx = M.toVector $ M.multiply xs (M.fromColumn cs)
    es = A.concat $ A.zipWith f (V.diff hx y) (M.rows xs)
    f d rs = V.mulScalar d rs
    norm = alpha / toNumber (M.nrows xs)
    ex = fromMaybe (M.zeros 1 1) $ M.fromArray (A.length y) (A.length cs) es
    gradient = map V.sum (M.columns ex)
    cs' = V.diff cs (V.mulScalar norm gradient)


