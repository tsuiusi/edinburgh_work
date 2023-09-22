# INF1A - Functional Programming: Types and Values

## Functional programming
* Operates on the data structure as a whole rather than piecemeal
* Usually works on a higher level (on the whole list)


## Values and types
* In Haskell we compute with values (e.g 42, "Hello!", True, +-, isAlive, etc)
* Every value has a type (e.g Int, String, Bool, Int, Bool, etc)

Types are written with the notation:
42 :: Int
"Hello!" :: String 
+ :: Int -> Int -> Int (Because there are two inputs and one output)

Functions are represented in Haskell like type, but takes the types of the input(s) and output(s)

'''
invert :: Picture -> Picture (for a function that inverts the colour of a picture)
knight :: Picture
flipV :: Picture -> Picture (for a function that flips a picture on the vertical axis)
'''

The hierarchy of functions is determined by brackets:
beside (invert knight) (flipV knight)
Inverting the order would switch the position of the pictures.

## Defining a new function
e.g

'''
double :: Picture -> Picture
double p = beside (invert knight) (flipV knight)
'''

Type signature optional, but makes things clearer

## Defining a new type

