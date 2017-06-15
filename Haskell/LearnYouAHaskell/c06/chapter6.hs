import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- 'Eq a' is like the Comparable interface in Java
isNeedleInHay :: (Eq a) => [a] -> [a] -> Bool
isNeedleInHay n h = foldl (||) False . map (isPrefixOf n) . tails $ h


-- f . g means f(g(x))
-- The books solution:
-- isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)


