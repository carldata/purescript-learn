module Test.Main where

import Prelude
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Node.FS (FS)
import Test.Assert (ASSERT)

import Test.Learn.IO (testIO)
import Test.Learn.Metrics (testMetrics)
import Test.Learn.Metrics.ConfusionMatrix (testConfusionMatrix)
import Test.Learn.Supervised.LinearRegression (testLinearRegression)
import Test.Learn.Unsupervised.OutlierDetection (testOutliers)


main :: ∀ eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
main = do
  testIO
  testMetrics
  testLinearRegression
  testOutliers  
  testConfusionMatrix
