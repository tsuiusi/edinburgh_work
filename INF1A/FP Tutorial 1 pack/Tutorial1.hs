module Tutorial1 where

import PicturesSVG -- needed for the optional chess part
import Test.QuickCheck

-- 2.
double :: Int -> Int
double x = x + x

square :: Int -> Int
square x = x ^ 2

-- 3.
isTriple :: Int -> Int -> Int -> Bool
isTriple a b c = a^2 + b^2 == c^2

-- 4.
leg1 :: Int -> Int -> Int
leg1 x y = x^2 - y^2

leg2 :: Int -> Int -> Int
leg2 x y = 2 * x * y

hyp :: Int -> Int -> Int
hyp x y = x^2 + y^2

-- 5.
prop_triple :: Int -> Int -> Bool
prop_triple x y = isTriple (leg1 x y) (leg2 x y) (hyp x y)
-- takes two integers, generates a pythagorean triple and verifies that it is, in fact, a pythagorean triple.

-- 8.
pic1 :: Picture
pic1 = beside knight (invert knight) `above` beside (invert knight) knight

pic2 :: Picture
pic2 = beside knight (invert knight) `above` flipV (beside knight (invert knight))

-- ** Functions

twoBeside :: Picture -> Picture
twoBeside x = beside x (invert x)

-- 9.
twoAbove :: Picture -> Picture
twoAbove x = x `above` invert x

fourPictures :: Picture -> Picture
fourPictures x = twoBeside (twoAbove x)

-- 10.
-- a)
emptyRow :: Picture
emptyRow = repeatH 4 (twoBeside whiteSquare)

-- b)
otherEmptyRow :: Picture
otherEmptyRow = repeatH 4 (twoBeside blackSquare)

-- c)
middleBoard :: Picture
middleBoard = repeatV 2 (twoAbove emptyRow)

-- d)
whiteRow :: Picture
whiteRow = over (beside rook (beside knight (beside bishop (beside queen (beside king (beside bishop (beside knight rook))))))) otherEmptyRow

blackRow :: Picture
blackRow = over (invert (beside rook (beside knight (beside bishop (beside queen (beside king (beside bishop (beside knight rook)))))))) emptyRow

pawnRow :: Picture
pawnRow = over (repeatH 8 pawn) emptyRow

-- e)
populatedBoard :: Picture
populatedBoard = blackRow `above` invert pawnRow `above` middleBoard `above` pawnRow `above` whiteRow
