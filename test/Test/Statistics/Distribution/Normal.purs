module Test.Statistics.Distribution.Normal (testNormalDistribution) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Math (sqrt)
import Test.Assert (assert, ASSERT)
import Statistics.Distribution.Normal as N


testNormalDistribution :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testNormalDistribution = do

    log "Prepare data for normal distribution test cases"
    let s1 = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]

    log "Estimate normal distribution from samples"
    assert $ N.fromSample s1 == N.normalDistr 3.5 (sqrt (35.0/12.0))
