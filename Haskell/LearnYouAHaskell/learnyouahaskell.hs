-- Example code from "Learn you a Haskell" (http://learnyouahaskell.com)
-- You can load this file in GHCi with :load learnyouahaskell.hs

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

{- Chapter 3
-}

-- Pattern matching
lucky :: (Integral a) => a -> String
lucky 7 = "Lucky you!"
lucky x = "Not today pal"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe y = "Not between one and two"

factorial1 :: (Integral a) => a -> a
factorial1 0 = 1
factorial1 n = n * (factorial (n-1))

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, x, _) = x

third :: (a, b, c) -> c
third (_, _, x) = x

head' :: [a] -> a
head' [] = error "no you cant do that!"
head' (x:_) = x
-- page 38

-- Guards

-- Where

-- Let

-- page 48

-- Case expression

-- the same thing as this
head'' :: [a] -> a
head'' xs = case xs of [] -> error "No head for empty lists!"
                       (x:_) -> x

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list."
-- the same thing as
describeList xs = "The list is" ++ what xs
    where
        what [] = "empty."
        what [x] = "a singleton list."
        what xs = "a longer list."
