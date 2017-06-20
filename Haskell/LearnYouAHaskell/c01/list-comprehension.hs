{- List comprehension is a way to transform, filter and combine lists.
-}

-- Here is an example of a function named "removeNonUppercase" that filters
-- all lowercase symbols

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [s | s <- st, elem s ['A'..'Z']]

