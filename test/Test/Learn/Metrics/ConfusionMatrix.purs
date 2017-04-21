module Test.Learn.Metrics.ConfusionMatrix (testConfusionMatrix) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Test.Assert (assert, ASSERT)

import Learn.Metrics.ConfusionMatrix ( calculate
                                     , accuracy
                                     , precision
                                     , recall
                                     , fscore )


testConfusionMatrix :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testConfusionMatrix = do


    log "Build model"
    let expected1 = [true, true, true, false, false, false]
    let predicted1 = [true, true, false, false, false, true]
    let cm = calculate expected1 predicted1
    assert $ cm.tn == 2 
    assert $ cm.fp == 1
    assert $ cm.fn == 1
    assert $ cm.tp == 2
    log "Precision"
    assert $ precision cm == 2.0/3.0
    log "Recall"
    assert $ recall cm == 2.0/3.0
    log "Accuracy"
    assert $ accuracy cm == 4.0/6.0
    log "F Score"
    assert $ fscore cm == 2.0 / 3.0
