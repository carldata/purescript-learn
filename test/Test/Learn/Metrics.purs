module Test.Learn.Metrics (testMetrics) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Test.Assert (assert, ASSERT)

import Learn.Metrics (mse)


testMetrics :: ∀ eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testMetrics = do
    log "\n#Test Metrics"
    testMSE


testMSE :: ∀ eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testMSE = do
    log "MSE"
    let xs = [1.0, 2.0, 1.0, 2.0, 1.0]
    let ys = [2.0, 2.0, 0.0, 2.0, 2.0]
    assert $ mse xs ys == 0.6
