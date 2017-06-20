import qualified Data.Map as Map
import Data.Char

phoneBook :: Map.Map String String
phoneBook = Map.fromList $
  [("betty", "123-3333")
  ,("bonnie", "123-1111")
  ,("clyde","777-2222")
  ]

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit

phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
  where add number1 number2 = number1 ++ ", " ++ number2
  
