module Tutorial3 where

import Data.Char (toUpper, isDigit, isLetter)
import Data.List
import Test.QuickCheck
import Data.Int (Int)

-- I am very proud to say I wrote all the functions myself from scratch like I'm supposed to 

-- These are some helper functions for makeKey and makeKey itself.
-- Exercises continue below.

rotate :: Int -> [Char] -> [Char]
rotate k list | 0 <= k && k <= length list = drop k list ++ take k list
              | otherwise = error "Argument to rotate too large or too small"

--  prop_rotate rotates a list of lenght l first an arbitrary number m times,
--  and then rotates it l-m times; together (m + l - m = l) it rotates it all
--  the way round, back to the original list
--
--  to avoid errors with 'rotate', m should be between 0 and l; to get m
--  from a random number k we use k `mod` l (but then l can't be 0,
--  since you can't divide by 0)

prop_rotate :: Int -> String -> Bool
prop_rotate k str = rotate (l - m) (rotate m str) == str
                        where l = length str
                              m = if l == 0 then 0 else k `mod` l

alphabet = ['A'..'Z']

makeKey :: Int -> [(Char, Char)]
makeKey k = zip alphabet (rotate k alphabet)

-- ** Caesar Cipher Exercises

-- 1.
lookUp :: Char -> [(Char, Char)] -> Char
lookUp char pairs = 
    if null matches then char else head matches
    where matches = [y | (x, y) <- pairs, x == char]

lookUpRec :: Char -> [(Char, Char)] -> Char
lookUpRec _ [] = error "List empty, mind empty"
lookUpRec char ((x, y): xs)
      | char == x = y
      | otherwise = lookUpRec char xs

prop_lookUp :: Char -> [(Char, Char)] -> Bool
prop_lookUp char pairs = 
      lookUp char pairs == lookUpRec char pairs


-- 2.
encipher :: Int -> Char -> Char
encipher n char = lookUp char (makeKey n)

-- 3.
normalise :: String -> String
normalise string = map toUpper [x | x <- string, isLetter x]

normaliseRec :: String -> String
normaliseRec [] = []
normaliseRec (x:xs)
      | isLetter x = toUpper x : normaliseRec xs
      | otherwise = normaliseRec xs

prop_normalise :: String -> Bool
prop_normalise string = 
      normaliseRec string == normalise string

-- 4.
enciphers :: Int -> String -> String
enciphers n string = map (encipher n) (normalise string)

-- 5.
reverseKey :: [(Char, Char)] -> [(Char, Char)]
reverseKey key = [(y, x) | (x, y) <- key]

reverseKeyRec :: [(Char, Char)] -> [(Char, Char)]
reverseKeyRec [] = []
reverseKeyRec ((x, y):xs) = (y, x) : reverseKeyRec xs

prop_reverseKey :: [(Char, Char)] -> Bool
prop_reverseKey key = 
      reverseKey key == reverseKeyRec key

-- 6.
decipher :: Int -> Char -> Char
decipher n char = lookUp char (reverseKey (makeKey n))

decipherStr :: Int -> String -> String
decipherStr n string = map (decipher n) (normalise string)


-- ** Optional Material

-- 7.
candidates :: String -> [(Int, String)]
candidates string = [(n, contained) | n <- [0..25], let contained = decipherStr n string, "THE"`isInfixOf`contained || "AND"`isInfixOf`contained]


splitEachFive :: String -> [String]
splitEachFive xs | length xs > 5 = take 5 xs : splitEachFive (drop 5 xs)
                 | otherwise     = [ fillToFive xs ]

fillToFive :: String -> String
fillToFive xs = xs ++ replicate (5 - length xs) 'X'

-- An alternative solution demonstrating 'repeat'
fillToFive' :: String -> String
fillToFive' xs = take 5 (xs ++ repeat 'X')

-- The following example shows why 'transpose' is not
--  invertible in general. The transpose function
--  takes the 'columns' of a list of lists, and makes
--  them the 'rows' of a new list of lists. 
--
-- [[o n e],           [[o t t f f],       [[o n e e e],
--  [t w o],            [n w h o i],        [t w o r],  
--  [t h r e e],   -->  [e o r u v],   -->  [t h r e],  
--  [f o u r],          [e r e],            [f o u], 
--  [f i v e]   ]       [e],        ]       [f i v]     ]   

-- 8.
encrypt :: Int -> String -> String
encrypt n string = concat (transpose (splitEachFive (enciphers n string)))

-- 9.
-- this function turned out to be useless
divideByFive :: String -> Int
divideByFive string = length string `div` 5

splitEachN :: String -> [String]
splitEachN xs = go xs (length xs `div` 5)
  where
    go s n
      | length s > n = take n s : go (drop n s) n
      | otherwise    = [s]

-- My failed function that was gonna divide the string into 5 segements of length n, which transposes back to an n x 5 matrix
-- splitEachN xs | length xs > n = take n xs : splitEachN (drop n xs)
              -- | otherwise     = [xs]
    -- where n = max 1 (divideByFive xs)

decrypt :: Int -> String -> String
decrypt n string =  concat (transpose (splitEachN (decipherStr n string)))