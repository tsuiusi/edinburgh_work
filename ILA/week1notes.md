# Week 1 Required reading
## Nicholson Linear Algebra, Pages 1-26

An equation of the form a1x1 + a2x2 + anxn = b is called a *linear equation* in the n variables x1, x2, ...xn.

a1, a2, ...an denote real numbers (coefficients) and b is also a number (constant term)

A finite collection of linear equations in the variables x1, x2, ...xn is called a system of linear equations in these variables.
 
2x1 - 3x2 + 5x3 = 7 is a linear equation.

Given a linear equation a1x1 + a2x2 + ...anxn = b, a sequence of s1, s2 ...sn of n numbers is called a solution to the equation of a1s1 + a2s2 + ...ansn = b

A system that has no solution is *inconsistent*, whereas a system with at least one solution is *consistent*.

If a system has one equation, then there must be infinitely many solutions.
If a system has two equations, there are 3 scenarios possible:
1. Intersect on one point - one solution
2. Parallel lines - no solution
3. Identical lines - infinitely many solutions

## Augmented matrices
[[3, 2, -1, 1, -1], [2, 0, -1, 2, 0], [3, 1, 2, 5, 2]]
Last column is the constant term in the equation (like as + by = c, where c is the constant)
Usually it's separated by a column like:
[3 2 6 9 | 2]
[1 6 0 3 | 4]
[2 9 8 5 | 7]

The array of coefficients is called the coefficient matrix whereas the constant column is called the constant matrix.

## Elementary operations
Two systems *equivalent* if they have the same set of solutions.
Turn the coefficient matrix into an identity matrix, and the constant matrix will contain the solutions (corresponding to the positions)
e.g 
x + 2y = -2
2x + y = 7

Final matrix will look like:
[1 0 | 16/3]
[0 1 | -11/3]

x = 16/3
y = -11/3

### Row operations
Every elementary row operation can be reversed by another elementary row operation of the same type:
1. Interchanging 2 rows, reversed by interchanging them again.
2. Multiplying a row by non-zero number then 1/(said number)
3. Adding k x (row p) to a different row q is reversed by doing the opposite (???) (p≠q)

### Continued from 22sep.md notes
Cases for any SLE:
1. No solution - when a row occurs in row-echelon form. System is inconsistent.
2. Unique solution - when every row is a leading row
3. Infinitely many solutions - when the system is consistent and there is at least one nonleading variable, so at least one parameter is involved.

A SLE is called *homogeneous* if the constant terms are 0.
If the solution for the system is a zero matrix, then the solution is called *trivial*.
Any solution with at least one nonzero value is called a nontrivial solution.

## Comprehensions
identity element, associative, commutative, type, etc // no relation to this



Any nonzero scalar multiple of a basic solution will still be called a basic solution.


Let A be an m × n matrix of rank r, and consider the homogeneous system in n variables with A as coefficient matrix. Then:
1. The system has exactly n − r basic solutions, one for each parameter. 
2. Every solution is a linear combination of these basic solutions.

