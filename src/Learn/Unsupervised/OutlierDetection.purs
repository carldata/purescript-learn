-- | Outlier detection 
-- | This model is based on the assumption that features are independed an normaly distributed
module Learn.Unsupervised.OutlierDetection
  ( Model
  , train
  , predict
  , predict1
  ) where

import Prelude
import Data.Array as A
import Data.Maybe (fromMaybe)
import LinearAlgebra.Matrix (Matrix, columns, rows)
import LinearAlgebra.Vector (Vector)
import Statistics.Distribution (density)
import Statistics.Distribution.Normal (NormalDistribution, fromSample, standard)


-- | Model based on normal distribution for each feature 
data Model = Model (Array NormalDistribution)

instance showModel :: Show Model where
  show (Model ds)= "Model: " <> show ds


-- Convert timestamp in seconds into the DateTime
train :: Matrix Number -> Model
train xs = Model $ mkDistr <$> columns xs
  where mkDistr = (fromMaybe standard <<< fromSample)


-- | Predict values based on learned model.
-- | This function will return probabilities of each feature vector
predict :: Model -> Matrix Number-> Vector Number
predict m xs = predict1 m <$> rows xs

-- | Predict value for a single sample
predict1 :: Model -> Vector Number -> Number
predict1 (Model ds) v = A.foldl (*) 1.0 $ A.zipWith density ds v
  
    