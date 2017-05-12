module Learn.Supervised.LinearRegression 
  ( Model
  , coefficients
  , predict
  , predict1
  , train
  ) where 


import Prelude
import Data.Array as A 
import Data.Maybe (fromMaybe)

import Learn.Math.Matrix as M 
import Learn.Math.Vector as V


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
train xs y = Model $ gradientDescent initCoef (M.insertCol 0 b xs) y
  where 
    initCoef = A.replicate (M.ncols xs + 1) 1.0
    b = A.replicate (M.ncols xs + 1) 1.0


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
alpha = 0.01

-- Stop if error less then epsilon
epsilon :: Number
epsilon = 0.01

-- Helper function for prediction of single sample
-- This function assumes that feature vectors contains additional 1.0
-- for intercept.
score :: Vector   -- ^ Model coefficients
      -> Vector   -- ^ Features with bias term
      -> Number   -- ^ Expected value 
      -> Number   -- ^ Error term
score cs x y = h - y
  where
    h = fromMaybe 0.0 $ V.dot cs x


-- Learn model coefficients using gradient descent algorithm
gradientDescent :: Vector   -- ^ Model coefficients
                -> Matrix   -- ^ Train data
                -> Vector   -- ^ Labels 
                -> Vector   -- ^ Trained model coefficients
gradientDescent cs xs y = cs
  where
    -- norm = alpha / (M.nrows xs)
    err = A.zipWith f (M.rows xs) y
    f row y1 = V.mulScalar (score cs row y1) row
    c = map V.sum $ M.columns xs
