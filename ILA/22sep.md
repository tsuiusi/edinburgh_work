# ILA -  Lecture 2
## Wei En Tan

## Consistency
Consistent and Determinate: These systems have exactly one solution. This typically occurs when the number of equations is equal to the number of unknowns, and the equations are independent.

Consistent and Indeterminate: These systems have an infinite number of solutions. This usually happens when one or more of the equations are linearly dependent on the others, providing no new information, and leaving at least one variable free to take on any value.

If a system has no solutions, then it is *inconsistent*

## Associated System
An associated system refers to a system of equations that is derived from an original system by replacing the constants on the right-hand side of the equations with variables.

(Replacing the constant matrix with variables)

## Rank
The rank of a matrix in linear algebra is a fundamental concept that measures the "dimension" of the linear space spanned by its rows or columns. More specifically:
* The row rank of a matrix is the maximum number of linearly independent rows in the matrix.
* The column rank of a matrix is the maximum number of linearly independent columns in the matrix.

Homogeneous SLE: An SLE where the constant matrix is a zero matrix.

## Theorem 1.2.2:
Suppose a system of m equations in n variables is consistent, and that the rank of the augmented matrix is r. 
1. The set of solutions involves exactly n−r parameters. 
2. If r < n, the system has infinitely many solutions.
3. If r = n, the system has a unique solution.

## Linear Combinations
A linear combination is what you get by multiplying two vectors together.

"Every linear combination of solutions to an SLE is also a solution to that SLE" - False

e.g
[1 0 1 | 3]
[0 1 1 | 2]
[x y z]

x + t = 3
y + t = 2
z = t

(x y z) = (3 2 0) + t(-1 -1 1)
t = 0 then (x y z) = (3 2 0)
t = 1 then (x y z) = (2 1 1)
but if you add them together:
(3 2 0) + (2 1 1) = (5 3 1)
and x + z ≠ 3 (it equals 6)


