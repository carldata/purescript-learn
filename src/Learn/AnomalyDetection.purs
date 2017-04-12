-- | Anomaly detection algorithm
module Learn.AnomalyDetection
  ( Model
  , learn
  , predict
  ) where

import LinearAlgebra.Matrix (Matrix)


-- | Anomaly detection model
data Model = Model (Array Number)

-- Convert timestamp in seconds into the DateTime
learn :: Matrix Number -> Model
learn xs = Model []


-- | Predict values based on learned model
predict :: Model -> Matrix Number-> Matrix Number
predict _ xs = xs