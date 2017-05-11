module Test.Learn.Unsupervised.OutlierDetection (testOutliers) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Data.Array as A
import Data.Maybe (fromJust)
import Partial.Unsafe (unsafePartial)
import Test.Assert (assert, ASSERT)
import Learn.Math.Matrix as M
import Learn.Unsupervised.OutlierDetection (train, predict)


testOutliers :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testOutliers = do


    log "Build model"
    let test1 = unsafePartial $ fromJust $ M.fromArray 5 1 [1.0, 1.1, 0.9, 1.2, 1.0]
    let validate1 = unsafePartial $ fromJust $ M.fromArray 4 1 [1.0, 0.8, 9.0, 1.2]
    let model = train test1
    let y1 = predict model validate1
    assert $ A.length y1 == 4
    -- Probability is in range (0.0, 1.0)
    assert $ A.foldl (&&) true $ map (\x -> x >= 0.0 && x <= 1.0) y1
