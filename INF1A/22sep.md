# INF1A: Lists and Comprehensions
### Don Sannella

## Lists
The type of values in a list is first defined:

nums :: [Int]

chars :: [Char]

funcs :: [Picture -> Picture] 

secOrder :: [[Int]]

The function 'head' takes the first element of a list whereas 'tail' takes the last element.
'reverse' reverses it, 'null' checks if it's empty, 'length' returns the length, and ++ joins two lists.

++ is used like so:

[a, b, c] ++ [d, e, f]

\> [a, b, c, d, e, f]

Function definitions on lists can be written the same way as normal functions:
headEven :: [Int] -> Bool
headEven xs | not (null xs) = even (head xs)
	    | otherwise = False

This function uses *Guards*

Guards: Guards are used to test whether some conditions hold before executing an expression. They are normally used for pattern matching, and don't handle errors or exceptions. Like if else statements, but exceptions are caught by an 'otherwise' rather than breaking the statement.

## Strings
Functions work the same way on them.

Equality testing work on strings like in python (< > <= >= ==)

Functions can be defined on strings using patterns:

``` 
import Data.Char
capitalize :: String -> String
capitalize "" = ""
capitalize (c:cs) = (toUpper c) : cs
```
* (c: cs) is a pattern that matches a list (in this case, a string) with at least one element. c is the first element of the list (the first character of the string), and cs is the rest of the list (the rest of the string).
* toUpper c applies the toUpper function to c, converting the first character to uppercase.
* : cs appends the unchanged rest of the string (cs) to the capitalized first character.

## Tuples
Fixed length sequence of data where the components can have different types.

coords :: (Float, Float, Float)
coords = (1.6, 3.6, 139.9)

victims :: [(String, Int)]
victims = [(Frank, 59)), (Waitress, 29), (Juarezes, 48)]

```
metresToFtAndIn :: Float -> (Int,Int)
metresToFtAndIn metres = (feet,inches)
	where feet = floor (metres * 3.28084)
	      inches = round (metres * 39.37008) - 12 * feet
```

## List Comprehensions
Notation for defining computations in lists, like in Python.

e.g
[ n\*n | n <- [1, 2, 3]]
> [1, 4, 9]

Basically add write the function, divide with |, then assign whatever it is to the variable. Different variables are divided by commas.

The type still has to be defined first. 
For the example above:
(if it was called squares)
squares :: [Int] -> [Int]

Functions can also be defined in the second part as a condition:
```
pythagoreanTriples :: [(Int,Int,Int)] pythagoreanTriples =
[ (a,b,c) | a <- [1..10], b <- [1..10], c <- [1..10], aˆ2 + bˆ2 == cˆ2 ]
```

## Enumeration 
Two periods.
> [10..0]
[10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]

>['a'..'c']
['a', 'b', 'c']

## Sets
Some functions on lists are like set operations:
```
intersect :: Eq a => [a] -> [a] -> [a]
s `intersect` t = [ x | x <- s, x `elem` t ]
```

The Eq a constraint means that a must be a type that supports equality checks (with == and /=).

Where elem is a function in the Prelude that checks list membership for lists over any type on which equality testing works.

Equality testing: The process of checking whether two values are equal.

Differences:

1. All elements in a list have the same type, sets can be more diverse. 
2. Order of elements in a list is significant, not in sets. So the same set can be represented by different lists, not vice versa.
3. Because of the previous property of lists, head and tail is important but not for sets.

## Testing
Use quickCheck

