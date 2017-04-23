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
