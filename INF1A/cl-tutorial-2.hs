data Thing = A | B | C | D | E deriving (Eq, Show)

universe :: [Thing]
universe = [A, B, C, D, E]

data Colour = Orange | Blue deriving (Eq, Show)
data Bordered = Yes | No deriving (Eq, Show)
data Shape = Circle | Square deriving (Eq, Show)
data Size = Large | Small deriving (Eq, Show)

colour :: Thing -> Colour
colour A = Orange
colour B  = Orange
colour C = Orange
colour D = Blue
colour E = Orange

bordered :: Thing -> Bordered
bordered A = Yes
bordered B = No
bordered C = Yes
bordered D = Yes
bordered E = Yes

shape :: Thing -> Shape
shape A  = Circle
shape B = Square
shape C = Circle
shape D = Square
shape E = Square

size :: Thing -> Size
size A  = Large
size B = Large
size C = Large
size D = Large
size E = Small

type Predicate u = u -> Bool

isOrange :: Predicate Thing
isOrange x = colour x == Orange

isBlue :: Predicate Thing
isBlue x = colour x == Blue

isBordered :: Predicate Thing
isBordered x = bordered x == Yes

isNotBordered :: Predicate Thing
isNotBordered x = bordered x == No

isSquare :: Predicate Thing
isSquare x = shape x == Square

isCircle :: Predicate Thing
isCircle x = shape x == Circle

isLarge :: Predicate Thing
isLarge x = size x == Large

isSmall :: Predicate Thing
isSmall x = size x == Small

main :: IO ()
main = do   
    print $ all (\t -> colour t /= Blue || shape t /= Square || bordered t == Yes) universe
    print $ any (\t -> colour t == Orange && shape t == Circle && size t == Small) universe

-- not there exists a blue square
-- every square is not blue
    print $ not (any (\t -> colour t == Blue && shape t == Square) universe) 
    print $ all (\t -> shape t /= Square || colour t /= Blue) universe
