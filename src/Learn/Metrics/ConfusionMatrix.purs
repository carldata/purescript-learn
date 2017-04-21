-- | computer confusion matrix to evaluate the accuracy of a classification
module Learn.Metrics.ConfusionMatrix ( ConfusionMatrix
                                      -- Calculate and show data
                                     , calculate
                                     , toString
                                     -- Metrics
                                     , accuracy
                                     , precision
                                     , recall
                                     , fscore                                     
                                     ) where

import Prelude
import Data.Array as A
import Data.Int (toNumber)
import Data.Tuple (Tuple(..))
import LinearAlgebra.Vector (Vector)
  

type ConfusionMatrix = 
  { tn :: Int   -- True negatives
  , fp :: Int   -- False positives
  , fn :: Int   -- False negatives
  , tp :: Int   -- True positives
  }

toString :: ConfusionMatrix -> String 
toString mat = "[" <> show mat.tn <> ", " <> show mat.fp <> "]\n"
            <> "[" <> show mat.fn <> ", " <> show mat.tp <> "]\n"

-- | Create empty confusion matrix                          
empty :: ConfusionMatrix
empty = {tn: 0, fp: 0, fn: 0, tp: 0}

-- | Create confusion matrix from correct values 
-- | and estimated targets returned by classifier                          
calculate :: Vector Boolean -> Vector Boolean -> ConfusionMatrix 
calculate xs ys = A.foldl updateMatrix empty $ A.zip xs ys
  where
    updateMatrix :: ConfusionMatrix -> Tuple Boolean Boolean -> ConfusionMatrix 
    updateMatrix mat (Tuple true true) = mat { tp = mat.tp+1 }
    updateMatrix mat (Tuple true false) = mat { fn = mat.fn+1 }
    updateMatrix mat (Tuple false true) = mat { fp = mat.fp+1 }
    updateMatrix mat (Tuple false false) = mat { tn = mat.tn+1 }

-- | precision = TP / (TP + FP)    
precision :: ConfusionMatrix -> Number
precision mat = (toNumber mat.tp) / (toNumber (mat.tp + mat.fp))

-- | recall = TP / (TP + TN)    
recall :: ConfusionMatrix -> Number
recall mat = (toNumber mat.tp) / (toNumber (mat.tp + mat.fn))

-- | accuracy = (TP + TN) / (TP + TN + FP + FN)
accuracy :: ConfusionMatrix -> Number
accuracy mat = (toNumber (mat.tp + mat.tn)) / (toNumber (mat.tp + mat.tn + mat.fp + mat.fn))

-- | F1 score = 2 * (precision * recall) / (precision + recall)
fscore :: ConfusionMatrix -> Number
fscore mat = 2.0 * (p * r) / (p + r)
  where
    p = precision mat
    r = recall mat
