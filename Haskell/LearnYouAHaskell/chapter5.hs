{- Chapter 5 -}

{- Okay, this chapter is about "Currying functions".
If I am not wrong that means that a function in haskell
is acting like a mathematical operator where the result
is a function.
-}

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

-- multThree 9 returns a operator that takes one values and returns
-- a function that takes one value and returns a value
multTwoWithNine :: Int -> Int -> Int
multTwoWithNine a b = multThree 9 a b

-- This means we can write the above statement as
multTwoWithNine' :: Int -> Int -> Int
multTwoWithNine' = multThree 9


applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

-- This means basically: calculate f(x1,y1), ..., f(xn,yn)
-- if m > n and one of the arrays have dim m means that the
-- new array will have dim n.
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
    where
        g x y = f y x
-- f(x,y)=C1, f(y,x)=g(x,y)

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x = x : filter p xs
    | otherwise = filter p xs

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) =
    let smallerOrEqual = filter (<= x) xs
        larger = filter (> x) xs
    in quicksort' smallerOrEqual ++ [x] ++ quicksort' larger

largestDivisible :: Integer
largestDivisible = head (filter p [100000,99999..])
    where p x = mod x 3829 == 0

{-
Implementation of Collatz sequence
-}

chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n:chain (div n 2)
  | odd n = n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
  where isLong xs = length xs > 15

{-
 It is also possible to map with functions than requires more than one parameters. 
-}

numLongChains' :: Int
numLongChains' = length (filter (\xs -> length xs > 15) (map chain [1..100]))

lambdaTest :: [Int]
lambdaTest = map (\x -> x + 3) [1,2,3,4]

lambdaMoreParam :: [Int]
lambdaMoreParam = zipWith (\x y -> x + y) [1, 2, 3, 4] [4, 3, 2, 1]

lambdaMoreParam2 :: [Int]
lambdaMoreParam2 = map (\(x, y) -> x + y) [(1,4), (2,3), (3,2), (4,1)]

-- NOTE If a pattern match fails in a lambda, a runtime error will occur

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

addThree' :: Int -> Int -> Int -> Int
addThree' = \x -> \y -> \z -> x + y + z

-- These two are equivalent due to currying

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs

-- The equivalent function with foldl is
map''' :: (a -> b) -> [a] -> [b]
map''' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

{- Function Composition -}
funcComp :: [Int]

-- funcComp = map (\x -> negate (abs x)) [5, -3, -6, 7]
-- same as
funcComp = map (negate . abs) [5, -3, -6, 7]

-- Multiparameter function composition
funcComp2 :: Int
funcComp2 = sum . replicate 4 $ max 4.5 2

-- Dollar has lower rank than space, sum . replicate 4 returns a partial applied function that operates on the result of max 4.5 2

{- Example of a function written in "point-free style" -}
sum''' :: (Num a) => [a] -> a
sum''' = foldl (+) 0

{- Another example. Here we can see the power of function composition:
fn x = ceiling (negate (tan (cos (max 50 x))))
is equivalent to
fn' = ceiling . negate . tan . cos . max 50
-}


oddSquareSum :: Integer
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) [1..]
