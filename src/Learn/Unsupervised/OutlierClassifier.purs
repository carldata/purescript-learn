-- | Outlier classifier 
-- | This model is based on the assumption that features are independed an normaly distributed
-- |
module Learn.Unsupervised.OutlierClassifier
  ( Model
  , learn
  , predict
  ) where

import Prelude
import Data.Maybe (fromMaybe)
import LinearAlgebra.Matrix (Matrix, columns, rows)
import LinearAlgebra.Vector (Vector)
import Statistics.Distribution.Normal (NormalDistribution, fromSample, standard)


-- | Model based on normal distribution for each feature 
data Model = Model (Array NormalDistribution)


-- Convert timestamp in seconds into the DateTime
learn :: Matrix Number -> Model
learn xs = Model $ mkDistr <$> columns xs
  where mkDistr = (fromMaybe standard <<< fromSample)


-- | Predict values based on learned model.
-- | This function will return probabilities of each feature vector
predict :: Model -> Matrix Number-> Vector Number
predict m xs = predict1 m <$> rows xs

-- | Predict value for a single sample
predict1 :: Model -> Vector Number -> Number
predict1 m v = 0.0
  
    