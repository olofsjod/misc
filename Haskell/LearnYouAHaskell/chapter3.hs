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
factorial1 n = n * (factorial1 (n-1))

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

-- Guards, Where
bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight"
    | bmi <= normal = "Normal"
    | bmi <= fat    = "You're fat! Lose some weight"
    | otherwise     = "Youre a whale"
    where
        bmi = weight / height ^ 2
        (skinny, normal, fat) = (18.5, 25.0, 30.0)
    {-where
        bmi = weight / height ^ 2
        skinny = 18.5
        normal = 25.0
        fat = 30.0
    -}

{-
This example won't work. Because where bindings aren't
shared across function bodies of different patterns.

greet :: String -> String
greet "Juan" = niceGreeting ++ " Juan!"
greet "Fernando" = niceGreeting ++ " Fernando!"
greet name = badGreeting ++ " " ++ name
    where
        niceGreeting = "Hello <3"
        badGreeting = "Oh. Pfft, it's you."
-}

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where
        (f:_) = firstname
        (l:_) = lastname

-- Anonymous functions in Haskell
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0]

-- Let
cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in  sideArea + 2 * topArea

-- Same thing as:
cylinder' :: Double -> Double -> Double
cylinder' r h = sideArea + 2 * topArea
    where
        sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2


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
