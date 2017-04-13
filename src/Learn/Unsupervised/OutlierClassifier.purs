-- | Outlier classifier 
-- | This model is based on the assumption that features are independed an normaly distributed
-- |
module Learn.Unsupervised.OutlierClassifier
  ( Model
  , learn
  , predict
  ) where

import LinearAlgebra.Matrix (Matrix)
import Statistics.Distribution.Normal (NormalDistribution)


-- | Model based on normal distribution for each feature 
data Model = Model (Array NormalDistribution)


-- Convert timestamp in seconds into the DateTime
learn :: Matrix Number -> Model
learn xs = Model []


-- | Predict values based on learned model.
-- | This function will return probabilities of each feature vector
predict :: Model -> Matrix Number-> Matrix Number
predict _ xs = xs