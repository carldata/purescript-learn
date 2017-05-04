module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Test.Assert (ASSERT)

import Test.Learn.Unsupervised.OutlierDetection (testOutliers)
import Test.Learn.Metrics (testMetrics)
import Test.Learn.Metrics.ConfusionMatrix (testConfusionMatrix)


main :: ∀ eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
main = do
  testMetrics
  testOutliers  
  testConfusionMatrix
  
