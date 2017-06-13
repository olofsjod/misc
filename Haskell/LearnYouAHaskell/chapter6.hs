import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- I don't understand... Why not Num a?
isNeedleInHay :: (Eq a) => [a] -> [a] -> Bool
isNeedleInHay n h = foldl (||) False . map (isPrefixOf n) . tails $ h

-- The books solution:
isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any . needle `isPrefixOf` $ tails haystack

