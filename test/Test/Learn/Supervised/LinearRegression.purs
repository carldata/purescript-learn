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
-- import Learn.Supervised.LinearRegression (coefficients, train)


testLinearRegression :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
testLinearRegression = do
    log "\n# Test Linear regression"
    testFromFile 


testFromFile :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
testFromFile = do
  log " * From linear1.csv file"
  csv <- readTextFile UTF8 "testdata/linear1.csv"
  let ds = IO.fromCsv csv
  assert true
  -- let (Tuple xs y) = M.split (0..1) 
  -- let model = train ds []
  -- assert $ coefficients model == [-4.0, 0.8]
