module Test.Learn.Unsupervised.OutlierClassifier (testOutlierClassifier) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Data.Array as A
import Data.Maybe (fromJust)
import Partial.Unsafe (unsafePartial)
import Test.Assert (assert, ASSERT)
import LinearAlgebra.Matrix as M
import Learn.Unsupervised.OutlierClassifier (train, predict)


testOutlierClassifier :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testOutlierClassifier = do


    log "build model"
    let test1 = unsafePartial $ fromJust $ M.fromArray 5 1 [1.0, 1.1, 0.9, 1.2, 1.0]
    let validate1 = unsafePartial $ fromJust $ M.fromArray 4 1 [1.0, 0.8, 9.0, 1.2]
    let model = train test1
    let y1 = predict model validate1
    assert $ A.length y1 == 4
