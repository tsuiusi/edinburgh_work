data Thing = A | B | C | D | E deriving (Eq,Show)

things :: [Thing]
things = [ A, B, C, D, E ]

data Colour = Amber | Blue deriving Eq

colour :: Thing -> Colour
colour A = Amber
colour B = Amber
colour C = Amber
colour D = Blue
colour E = Amber
            
data Shape = Square | Disc deriving Eq

shape :: Thing -> Shape
shape A = Square
shape B = Square
shape C = Disc
shape D = Square
shape E = Square
           
data Size = Big | Small deriving Eq

size :: Thing -> Size
size A = Big
size B = Big
size C = Big
size D = Big
size E = Small
       
data Border = Thin | Thick deriving Eq

border :: Thing -> Border
border A = Thick
border B = Thin
border C = Thick
border D = Thick
border E = Thick

type Predicate u = u -> Bool

isAmber :: Predicate Thing
isAmber x = colour x == Amber

isBlue :: Predicate Thing
isBlue x = colour x == Blue

isSquare :: Predicate Thing
isSquare x = shape x == Square

isDisc :: Predicate Thing
isDisc x = shape x == Disc

isBig :: Predicate Thing
isBig x = size x == Big

isSmall :: Predicate Thing
isSmall x = size x == Small

hasThinBorder :: Predicate Thing
hasThinBorder x = border x == Thin

hasThickBorder :: Predicate Thing
hasThickBorder x = border x == Thick

--------------------------------------
-- Your task is to replace 'undefined' with the definitions of the operators below.

(|=) :: Predicate Thing -> Predicate Thing -> Bool
a |= b = all (\x -> a x == b x) things

(|/=) :: Predicate Thing -> Predicate Thing -> Bool
a |/= b = any (\x -> a x /= b x) things

(||=) :: [Predicate Thing] -> Predicate Thing -> Bool
a ||= b = all (\x -> (all ($ x) a) ==> b x) things 
-- all $ x a checks if all elements satisfies the predicate
-- if a is true, then b must also be true
-- if a is false, a==> b is true
-- checks if everything in things satisfies all predicates in a and in b
    where 
        a ==> b = not a || b -- either this or that

neg :: Predicate u -> Predicate u
(neg a) x = not (a x)

(|:|) :: Predicate u -> Predicate u -> Predicate u
(a |:| b) x = a x || b x

(&:&) :: Predicate u -> Predicate u -> Predicate u
(a &:& b) x = a x && b x

isBlueisSquareisBig = (isBlue &:& isSquare) |= isBig
isBigisAmberisntDisc = (isBlue &:& isAmber) &:& neg isDisc

iBiSiB = [isBlue, isSquare] ||= isBig
iBiAinD = [isBig, isAmber] ||= (neg isDisc)

-- Combining our infix operators may lead to ambiguous expressions. For example, 'a |:| b &:& c' can be read in two ways: either '(a |:| b) &:& c' or 'a |:| (b &:& c)'. We can always instruct Haskell which one to choose by adding paranthesis ourselves. 
-- But there are also ways of instructing Haskell how to disambiguate. The next lines are setting the precedence for our infix operators. To learn more about this, read, for example, https://www.cs.auckland.ac.nz/references/haskell/haskell-intro-html/functions.html . It is not crucial you understand all this at the moment; we will remind you of fixity declarations later on during the course. In short, these lines guarantee a non-ambiguous parsing of our code.

infixr 0 |=
infixr 0 |/=
infixr 0 ||=
infixr 2 |:|
infixr 3 &:&
