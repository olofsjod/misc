{- Chapter 2
-}

-- What is the difference between -> and <-?
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [s | s <- st, elem s ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- The difference between Integer and Int is that Integer has BIG numbers...
factorial :: Integer -> Integer
factorial n = product [1..n]

-- OK.. The difference between Float and Double is that Float is a real floating
-- point has single point precision but Double has double.. (?!)
circumference :: Float -> Float
-- circumference :: Double -> Double
circumference r = 2 * pi * r

-- show is a function that takes a parameter that is of typeclass Show and
-- return it in String
--show 3
--show 5.334

-- read is a function that takes a String and returns a Read typeclass
