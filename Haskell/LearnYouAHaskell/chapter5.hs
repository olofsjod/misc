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
