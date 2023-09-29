module Tutorial2 where

import Data.Char (isDigit, digitToInt, toUpper, toLower, isUpper, isLetter)
import Data.List
import Test.QuickCheck


-- 1. inRange

inRange :: Int -> Int -> [Int] -> [Int]
inRange lo hi xs = [x | x <- xs, x >= lo, x <= hi]

-- 2. multDigits

multDigits :: String -> Int
multDigits str = let number = (map digitToInt (filter isDigit str)) in if null number then 1 else product number

-- made with the help of GPT4 - finding the functions, understanding what they did, debugging, doing the if statement part

countDigits :: String -> Int
countDigits str = length (filter isDigit str)

prop_multDigits :: String -> Bool
prop_multDigits str = 9^(countDigits str) >= multDigits str

test_prop_multDigits :: IO()
test_prop_multDigits = quickCheck prop_multDigits

-- 3. capitalise and title

capitalise :: String -> String
capitalise word = toUpper (head word) : map toLower (tail word)
-- GPT4 help to find the function 'head'

title :: [String] -> [String]
title words = [capitalise word | word <- words]

-- 4. score and totalScore

score :: Char -> Int
score x
    | not (isLetter x) = 0
    | isVowel && isUpper x = 3
    | isVowel || isUpper x = 2
    | otherwise = 1
    where 
        isVowel = toLower x `elem` "aeiou"
-- Order of conditionals matter - if the second and third were interchanged then the function breaks 

totalScore :: String -> Int
totalScore xs = product [score x | x <- xs]

-- This is very confusing as it would in fact return 0 if there was a non-letter string like ".,/.,122312"
-- product [score "1"] would still return 0 so I'm really not sure on this.
prop_totalScore_pos :: String -> Bool
prop_totalScore_pos xs = totalScore xs >= 1

-- ** Optional Material

-- 5. crosswordFind

crosswordFind :: Char -> Int -> Int -> [String] -> [String]
crosswordFind letter pos len words = 
    filter predicate words
    where
        predicate word = 
            length word == len && 
            word !! pos == letter


-- 6. search

search :: String -> Char -> [Int]
search str goal = undefined

-- Depending on the property you want to test, you might want to change the type signature
prop_search :: String -> Char -> Bool
prop_search str goal = undefined

