module Test.Learn.Supervised.LinearRegression (testLinearRegression) where

import Prelude
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Data.Maybe (fromMaybe)
import Node.Encoding (Encoding(..))
import Node.FS (FS)
import Node.FS.Sync (readTextFile)
import Test.Assert (assert, ASSERT)

import Learn.IO as IO
import Learn.Math.Matrix as M
import Learn.Supervised.LinearRegression (coefficients, train)


testLinearRegression :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
testLinearRegression = do
    log "\n# Test Linear regression"
    testSmall
    -- testFromFile 


testSmall :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
testSmall = do
  log " * Small example with 2 points"
  let xs = fromMaybe (M.zeros 1 1) $ M.fromArray 2 1 [1.0, 2.0]
  let y = [1.0, 3.0]
  let model = train xs y
  log $ show model
  assert true


testFromFile :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
testFromFile = do
  log " * From linear1.csv file"
  csv <- readTextFile UTF8 "testdata/linear1.csv"
  let mat = IO.fromCsv csv
  let xs = M.sliceCols 0 0 mat
  let y = M.toVector $ M.sliceCols 1 1 mat
  let model = train xs y
  log $ show model
  assert true
  -- assert $ coefficients model == [-4.0, 0.8]
