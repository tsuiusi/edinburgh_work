-- Informatics 1 - Functional Programming 
-- Class Test 2023

module ClassExam where

import Data.Char (isAlpha, ord)
import Test.QuickCheck
import Data.Bool (Bool(False))

-- Problem 1

-- a

f :: String -> Int
f string = sum [ord x | x <- string, isAlpha x]

-- b

g :: String -> Int
g [] = 0
g (x:xs) | isAlpha x = ord x + g xs
         | otherwise = f xs

-- c

h :: String -> Int
h string = foldr (\x acc -> if isAlpha x then ord x + acc else acc) 0 string -- I'm pretty sure this isn't recursion

-- d

prop_fgh :: String -> Bool
prop_fgh string = f string == g string && g string == h string

-- Problem 2

-- a

c :: String -> String -> Bool
c string1 string2 = and [x == y | (x, y) <- zip string1 string2, isAlpha x, isAlpha y]

-- b

d :: String -> String -> Bool
d [] _ = True
d _ [] = True
d (x:xs) (y: ys) | isAlpha x && isAlpha y = x == y && d xs ys
                 | isAlpha x || isAlpha y = d xs ys
                 | otherwise = d xs ys

-- c

prop_cd :: String -> String -> Bool
prop_cd s1 s2 = c s1 s2 == d s1 s2
