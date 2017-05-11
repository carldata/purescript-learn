module Test.Learn.IO (testIO) where

import Prelude
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Node.Encoding (Encoding(..))
import Node.FS (FS)
import Node.FS.Sync (readTextFile)
import Test.Assert (assert, ASSERT)

import Learn.Math.Matrix as M
import Learn.IO as IO


testIO :: ∀ eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
testIO = do

  log "\n# IO tests"
  fromFileTest

    
fromFileTest :: ∀ eff. Eff (console :: CONSOLE, assert :: ASSERT, exception :: EXCEPTION, fs :: FS  | eff) Unit
fromFileTest = do
  log "Test load linear1.csv"
  csv <- readTextFile UTF8 "testdata/linear1.csv"
  let ds = IO.fromCsv csv
  assert $ M.nrows ds == 97
  assert $ M.ncols ds == 2
