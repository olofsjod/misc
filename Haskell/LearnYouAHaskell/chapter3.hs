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
