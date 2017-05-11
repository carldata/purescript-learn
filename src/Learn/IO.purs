module Learn.IO (fromCsv) where
  
import Prelude
import Data.Array as A
import Data.Maybe (fromMaybe)
import Data.String as S
import Global (readFloat)

import Learn.Math.Matrix as M
import Learn.Math.Vector (Vector)


-- | Load all columns from CSV. 
-- | First column is treated as a index for all Time Series. 
-- | So this function will return #column-1 Time Series
fromCsv :: String -> M.Matrix Number
fromCsv str = fromMaybe (M.zeros 1 1) $ M.fromArray rn cn ds
  where
    rows = parseLines $ S.split (S.Pattern "\n") str
    ds = A.concat rows 
    rn = A.length rows
    cn = (A.length ds) / rn


parseLines :: Array String -> Array (Vector Number)
parseLines lines = map f lines
  where 
    f :: String -> Vector Number
    f str = readFloat <$> (S.split (S.Pattern ",") str)
