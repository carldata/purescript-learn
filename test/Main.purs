module Test.Main where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)

import Test.Assert (ASSERT)

import Test.Statistics.Sample (testSample)
import Test.Statistics.Distribution.Normal (testNormalDistribution)


main :: ∀ eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
main = do
  testSample
  testNormalDistribution
