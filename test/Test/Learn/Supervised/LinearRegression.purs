module Test.Learn.Supervised.LinearRegression (testLinearRegression) where

import Prelude
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
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
    testFromFile 


testFromFile :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
testFromFile = do
  log " * From linear1.csv file"
  csv <- readTextFile UTF8 "testdata/linear1.csv"
  let mat = IO.fromCsv csv
  assert true
  let xs = M.sliceCols 0 0 mat
  let y = M.toVector $ M.sliceCols 1 1 mat
  let model = train xs y
  log $ show model
  assert true
  -- assert $ coefficients model == [-4.0, 0.8]
