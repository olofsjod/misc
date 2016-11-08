-- Anteckningar från 'Haskell tutorial'
-- https://www.youtube.com/watch?v=02_H3LjqMr8

-- Comment

{- Multiline comment
 -}
import Data.List
import System.IO

-- Datatypes
--
-- Int -2^63 2^63

maxInt = maxBound :: Int
minInt = minBound :: Int

-- Integer
-- Double
-- Bool True False
-- Char
-- Tuple

always5 :: Int
always5 = 5


sumOfNums = sum [1..1000]
example = 5 + 4 - 6 * 7 / 10

modEx = mod 5 4
modEx2 = 5 `mod` 4

negNumEx = 5 + (-4)

num9 = 9 :: Int

sqrtOf9 = sqrt (fromIntegral num9)

-- Built in math functions
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999

-- sin, cos, tan, asin, atan, acos, sinh
-- tanh, cosh, asinh, atanh, acosh
--

trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

-- List

primeNumbers = [3,5,7,11]
morePrimes = primeNumbers ++ [13,17,19,23,29]

favNums = 2 : 7 : 21 : 61 : []  -- a : [b] ger [a,b] obs

lenPrimes = length morePrimes
reversePrimes = reverse morePrimes
isListEmpty = null morePrimes
secondPrime = morePrimes !! 1 -- Liknar morePrimes[1] i C
firstPrime = head morePrimes
lastPrime = last morePrimes

primeInit = init morePrimes -- Alla element förutom det sista
first3Primes = take 3 morePrimes
removePrimes = drop 3 morePrimes

is7InList = 7 `elem` morePrimes

maxPrime = maximum morePrimes
minPrime = minimum morePrimes

sumPrimes = sum morePrimes
productPrimes = product morePrimes

zeroToTen = [0..10]
evenNumbers = [2,4..20]
letterList = ['A','C'..'Z']

infinPow10 = [10,20..]

many2s = take 10 (repeat 2)
many3s = replicate 10 3

cycleList = take 10 (cycle [1,2,3,4,5])

listTimes2 = [x * 2 | x <- [1..10]]
listTimes3 = [x * 3 | x <- [1..10], x * 3 <= 50]

divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0] -- Tar ut värden som dividerar med 13

sortedList = sort [9,1,2,4,5,2,1,5]

sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]

listBiggerThan5 = filter (>5) morePrimes

evensUpTo20 = takeWhile (<= 20) [2,4..]

divOfListFromLeft = foldl (/) 1 [2,3,4,5] -- (/) ((/) ((/) ((/) 1 2) 3) 4) 5
divOfListFromRight = foldr (/) 1 [2,3,4,5] -- (/) 2 ((/) 3 ((/) 4 ((/) 5 1)))

