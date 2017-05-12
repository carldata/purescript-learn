module Test.Helper where 

import Prelude
import Data.Array as A
import Math (abs)


class AlmostEq a where
  almostEq :: a -> a -> Boolean

infix 4 almostEq as ~=

instance almostEqNumber :: AlmostEq Number where
  almostEq x y = abs (x - y) < 0.1

instance almostEqArray :: AlmostEq a => AlmostEq (Array a) where
  almostEq xs ys = A.length xs == A.length ys && A.foldl (&&) true bs
    where bs = A.zipWith (~=) xs ys
