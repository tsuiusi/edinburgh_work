data Thing = A | B | C | D | E
           deriving (Eq, Show)

universe :: [Thing]
universe = [A, B, C, D, E]

Type Colour = Orange | Blue
Type Bordered = Yes | No
Type Shape = Circle | Square
Type Size = Large | Small
