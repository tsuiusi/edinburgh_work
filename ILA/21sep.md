# Introduction to Linear Algebra
## Wei En Tan

Not all solutions to linear equations lie on a straight line:
* A linear equation is a system where a1x1 + a2x2 + ...anxn = b
* ai, b E R
* If the points that satisfy a linear equation don't lie on a straight line then not all solutions will lie on a straight line

e.g:
2x - y - z = 0
[x y z] = [0 0 0] is True
[x y z] = [1 1 1] is True
[x y z] = [2 1 0] is True

Row operations produce equivalent systems and cannot be performed in parallel.

RowOps => Eq. Sys

Not Eq. Sys => Not RowOps

## Row Echelon Form
Conditions:
1. All non-zero rows are above any rows of all zeroes
2. The pivot of a non-zero row is always to the right of the leading coefficient of the row above
3. Each leading coefficient is a 1 and is the only non-zero entry in the column

[1 2 5 | 2]
[0 1 5 | 3]
[0 0 1 | 7]

## Reduced Row Echelon Form
Conditions:
1. All rows with zero entries are in the bottom
2. The leading entry in each row is 1
3. The pivot of each row is to the right of the pivot on the row above
4. Each pivot is the only non-zero entry in the column

[1 0 0 | a]
[0 1 0 | b]
[0 0 1 | c]


