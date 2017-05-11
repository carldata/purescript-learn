module Learn.Supervised.LinearRegression 
  ( Model
  , coefficients
  , predict
  , predict1
  , train
  ) where 


import Learn.Math.Matrix (Matrix)
import Learn.Math.Vector (Vector)


data Model = Model (Array Number)

-- | Get model coefficients
coefficients :: Model -> Array Number 
coefficients (Model cs) = cs 


-- | Train model using gradient descent
train :: Matrix Number  -- ^ Train data
      -> Vector Number  -- ^ Target values
      -> Model          -- ^ Trained model
train xs y = Model [] 


-- | Predict values based on trained model      
predict :: Model -> Matrix Number-> Vector Number
predict (Model cs) xs = []

-- | Predict value for a single sample
predict1 :: Model -> Vector Number -> Number
predict1 (Model cs) x = 0.0
