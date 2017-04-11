-- | Anomaly detection algorithm
module Learn.Anomalies
  ( Model
  , learn
  , predict
  ) where


-- | Anomaly detection model
data Model = Model (Array Number)

-- Convert timestamp in seconds into the DateTime
learn :: Array Number -> Model
learn xs = Model []


-- | Predict values based on learned model
predict :: Model -> Array Number -> Array Number
predict _ xs = xs