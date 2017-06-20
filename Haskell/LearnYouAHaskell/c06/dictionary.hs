phoneBook =
      [("betty", "555-2392")
      ,("bonnie", "444-4444")
      ,("patsy", "493-2444")
      ,("benny", "133-1337")
      ]

-- This will throw an exeption if the key doesn't exist
findKey :: (Eq k) => k -> [(k, v)] -> v
findKey key xs = snd . head . filter (\(k, v) -> key == k) $ xs

-- However, this won't.
findKey' :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey' key [] = Nothing
findKey' key ((k,v):xs)
  | key == k = Just v
  | otherwise = findKey' key xs

-- Implemented as a fold pattern
findKey'' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey'' key xs = foldr (\(k, v) acc -> if key == k then Just v else acc) Nothing xs

