module Test.Learn.Math.Matrix (testMatrix) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Data.Maybe (Maybe(..), fromMaybe, isJust, isNothing)
import Test.Assert (assert, ASSERT)
import Learn.Math.Matrix as M


testMatrix :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testMatrix = do
    log "\n# Test Matrix"
    testCreate
    testFromArray
    testGetRow
    testRows
    testGetValue
    testGetCol
    testColumns


testCreate :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testCreate = do
    log " * Create matrix"
    let z1 = M.zeros 5 4
    assert $ M.nrows z1 == 5
    assert $ M.ncols z1 == 4


testFromArray :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testFromArray = do
    log " * From Array"
    assert $ isNothing (M.fromArray 2 3 [1.0])
    assert $ isJust (M.fromArray 2 3 [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])


testGetRow :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testGetRow = do
    log " * Get specific row"
    let mat = fromMaybe (M.zeros 1 1) $ M.fromArray 2 3 [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
    assert $ M.row 0 mat == [1.0, 2.0, 3.0]    


testGetCol :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testGetCol = do
    log " * Get specific column"
    let mat = fromMaybe (M.zeros 1 1) $ M.fromArray 2 3 [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
    assert $ M.column 1 mat == [2.0, 5.0]


testGetValue :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testGetValue = do
    log " * Get specific value"
    let mat = fromMaybe (M.zeros 1 1) $ M.fromArray 2 3 [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
    assert $ M.element 1 2 mat == Just 6.0


testRows :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testRows = do
    log " * Get list of rows"
    let mat = fromMaybe (M.zeros 1 1) $ M.fromArray 2 3 [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
    assert $ M.rows mat == [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]
    

testColumns :: forall eff. Eff (console :: CONSOLE, assert :: ASSERT | eff) Unit
testColumns = do
    log " * Get list of columns"
    let mat = fromMaybe (M.zeros 1 1) $ M.fromArray 2 3 [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
    assert $ M.columns mat == [[1.0, 4.0], [2.0, 5.0], [3.0, 6.0]]
    