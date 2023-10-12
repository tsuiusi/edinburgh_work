module Tutorial4 where

import Data.Char (isUpper, isLetter)
import Data.List (zipWith)
import Test.QuickCheck
import Data.Ratio


-- 1. doubles
-- a.
doublesComp :: [Int] -> [Int]
doublesComp list =  [x * 2 | x <- list]

-- b.
doublesRec :: [Int] -> [Int]
doublesRec [] = [] -- ALWAYS REMEMBER EMPTY CASE FOR RECURSION!!!
doublesRec (x:xs) = x * 2 : doublesRec xs

-- c.
doubles :: Int -> Int
doubles x = 2 * x

doublesHO :: [Int] -> [Int]
doublesHO list =  map doubles list

-- d.
prop_doubles :: [Int] -> Bool
prop_doubles x = doublesComp x == doublesRec x && doublesRec x == doublesHO x

-- 2. aboves
-- a.
abovesComp :: Int -> [Int] -> [Int]
abovesComp n list = [x | x <- list, n < x]

-- b.
abovesRec :: Int -> [Int] -> [Int]
abovesRec _ [] = []
abovesRec n (x:xs) | x > n = x : abovesRec n xs
                   | otherwise = abovesRec n xs

-- c.
abovesHO :: Int -> [Int] -> [Int]
abovesHO n list =  filter (\x -> x > n) list

-- d.
prop_aboves :: Int -> [Int] -> Bool
prop_aboves n list = abovesComp n list == abovesRec n list && abovesRec n list == abovesHO n list

-- 3. parity
-- a.
xor :: Bool -> Bool -> Bool
xor x y = (x || y) && not (x && y)

-- b.
parityRec :: [Bool] -> Bool
parityRec [] = False
parityRec (x:xs) = x `xor` parityRec xs

-- c.
parityHO :: [Bool] -> Bool
parityHO list =  foldr xor False list -- like empty case in recursion

-- d.
prop_parity :: [Bool] -> Bool
prop_parity list = parityRec list == parityHO list

-- 4. allcaps
-- a.
allcapsComp :: String -> Bool
allcapsComp string = and [isUpper x | x <- string, isLetter x]

-- b.
allcapsRec :: String -> Bool
allcapsRec [] = True
allcapsRec (x:xs) | isLetter x && not (isUpper x) = False
                  | otherwise = allcapsRec xs

-- c.
allcapsHO :: String -> Bool
allcapsHO string = foldr (&&) True (map (\x -> not (isLetter x) || isUpper x) string) -- i'm missing the filter but simplicity is the ultimate sophistication amirite

-- d.
prop_allcaps :: String -> Bool
prop_allcaps string =  allcapsComp string == allcapsRec string && allcapsRec string == allcapsHO string


-- ** Optional material
-- Matrix manipulation

type Matrix = [[Rational]]

-- 5
-- a.
uniform :: [Int] -> Bool
uniform [] = True
uniform (x: xs) = all (==x) xs

-- b.
valid :: Matrix -> Bool
valid [] = False
valid (x:xs) = all (== length x) (map length xs) && all (\r -> length r > 0) (x:xs)


-- 6.
width :: Matrix -> Int
width [] = 0
width (x:xs) = length x

height :: Matrix -> Int
height [] = 0
height m = length m

plusM :: Matrix -> Matrix -> Matrix
plusM m1 m2 = zipWith (zipWith (+)) m1 m2

-- 7.
timesM :: Matrix -> Matrix -> Matrix
timesM m1 m2 = [[sum $ zipWith (*) row col | col <- transpose m2] | row <- m1]


-- ** Challenge

-- 8.
-- Mapping functions
mapMatrix :: (a -> b) -> [[a]] -> [[b]]
mapMatrix f = undefined

zipMatrix :: (a -> b -> c) -> [[a]] -> [[b]] -> [[c]]
zipMatrix f = undefined

-- All ways of deleting a single element from a list
removes :: [a] -> [[a]]     
removes = undefined

-- Produce a matrix of minors from a given matrix
minors :: Matrix -> [[Matrix]]
minors m = undefined

-- A matrix where element a_ij = (-1)^(i + j)
signMatrix :: Int -> Int -> Matrix
signMatrix w h = undefined
        
determinant :: Matrix -> Rational
determinant = undefined

cofactors :: Matrix -> Matrix
cofactors m = undefined        
                
scaleMatrix :: Rational -> Matrix -> Matrix
scaleMatrix k = undefined

inverse :: Matrix -> Matrix
inverse m = undefined

-- Tests
identity :: Int -> Matrix
identity n = undefined

prop_inverse1 :: Rational -> Property
prop_inverse1 a = undefined

prop_inverse2 :: Rational -> Rational -> Rational 
                -> Rational -> Property
prop_inverse2 a b c d = undefined

type Triple a = (a,a,a)
        
prop_inverse3 :: Triple Rational -> 
                 Triple Rational -> 
                 Triple Rational ->
                 Property
prop_inverse3 r1 r2 r3 = undefined
