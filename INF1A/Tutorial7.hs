module Tutorial7 where

import LSystem
import Test.QuickCheck
import Data.Bool (Bool(False, True))


pathExample = Go 30 :#: Turn 120 :#: Go 30 :#: Turn 120 :#: Go 30

-- 1a. copy
copy :: Int -> Command -> Command
copy 0 _ = Sit
copy n command = command :#: copy (n-1) command -- Recursively calls command, terminates at 0

-- 1b. polygon
polygon :: Distance -> Int -> Command
polygon length n = copy n command
    where 
        command = Go length :#: Turn angle
        angle = 360 / fromIntegral n

-- 2. snowflake
snowflake :: Int -> Command
snowflake x = f x :#: n :#: n :#: f x :#: n :#: n :#: f x :#: n
  where
    f 0 = Go 10
    f x = f (x-1) :#: p :#: f (x-1) :#: n :#: n :#: f (x-1) :#: p :#: f (x-1)
    n = Turn 60
    p = Turn (-60)

-- 3. sierpinski
sierpinski :: Int -> Command -- group definitions together
sierpinski x = f x
    where 
        f 0 = Go 10
        f x = g (x-1) :#: p :#: f (x-1) :#: p :#: g (x-1)
        g 0 = Go 10
        g x = f (x-1) :#: n :#: g (x-1) :#: n :#: f (x-1)
        n = Turn 60
        p = Turn (-60)

     
-- 4. hilbert
hilbert :: Int -> Command -- f needs not be recursive
hilbert x = l x
  where
    f = Go 10
    n = Turn 90
    p = Turn (-90)
    l 0 = Sit
    l x = p :#: r (x-1) :#: f :#: n :#: l (x-1) :#: f :#: l (x-1) :#: n :#: f :#: r (x-1) :#: p
    r 0 = Sit
    r x = n :#: l (x-1) :#: f :#: p :#: r (x-1) :#: f :#: r (x-1) :#: p :#: f :#: l (x-1) :#: n

-- 5. dragon
dragon :: Int -> Command
dragon x =  l x 
  where
    f = Go 10
    n = Turn 90
    p = Turn (-90)
    l 0 = Sit
    l x = l (x-1) :#: p :#: r (x-1) :#: f :#: p
    r 0 = Sit
    r x = n :#: f :#: l (x-1) :#: n :#: r (x-1)


-- ** Optional Material

-- 6a. split
split :: Command -> [Command]
split (c1 :#: c2) = split c1 ++ split c2
split Sit = []
split c = [c]

-- 6b. join
join :: [Command] -> Command -- with recursion
join []     = Sit
join (x:[]) = x
join (x:xs) = x :#: join xs

joinLC :: [Command] -> Command -- list comprehension
joinLC [] = Sit
joinLC xs = foldr1 (:#:) xs

-- 6c. equivalent
equivalent :: Command -> Command -> Bool
equivalent cmd1 cmd2 = split cmd1 == split cmd2

-- 6d. testing join and split
prop_split_join :: Command -> Bool
prop_split_join c =  equivalent (join (split c)) c

prop_split :: Command -> Bool -- prop_split c = null [x | x <- c, x == ":#:" || x == Sit] didn't work
prop_split c = all isSimpleCommand (split c)

isSimpleCommand :: Command -> Bool
isSimpleCommand (Go _) = True
isSimpleCommand (Turn _) = True
isSimpleCommand _ = False


-- 7. optimise
optimise :: Command -> Command -- stack the filter functions, then go through all the conditions.
optimise =  join . combine . filter notZero . split
  where
    notZero (Go 0) = False
    notZero (Turn 0) = False
    notZero (Sit) = False
    notZero _ = True
    combine [] = []
    combine [x] = [x]
    combine (Go x: Go y : xs) = combine (Go (x+y) : xs)
    combine (Turn x: Turn y : xs) = 
      if x + y == 0 then combine xs 
      else combine (Turn (x+y) : xs)
    combine (x:xs) = x : combine xs
