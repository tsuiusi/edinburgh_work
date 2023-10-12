# ILA
### Ivan Cheltsov

###Definition:
The i, j cofactor of the matrix A is:


c_ij(A) = (-1)^(i+j) det(A_ij)

The cofactor is the -1^(i+j) times the det of the submatrix that remains after removing the i-th row and j-th column.

Continue doing this until the matrix is a 2x2 (recursion), then sum the results.

> If A is a square upper triangular matrix then its det is the product of the diagonal.

## Properties of dets
If B is obtained by A by swapping columns vi and vj, and i≠j, THEN:

> det(B) = -det(A)

If B is obtained by multiplying column vi by some x, THEN:

> det(B) = xdet(A)


### Corollary
1. If vi=vj for some i≠j then det(A) = 0
2. If vi = 0 for some i E (1.....n), (fill this in once i get the slides

**THEOREM 3.1.3**: If A is an nxn matrix, then det(uA) = u^n det(A)

## Multilinearity
If you fix all columns in a square matrix except one, then it becomes linear.

If a multiple of one column is added to another, the determinant doesn't change.

If a multiple of one row of A is added to another, the determinant doesn't change.

So this can be used to simplify matrices and find the determinant much easier, and it's called the **Vandermonde determinant**

> det(A) = product(xi - xj)
            1<=j<=i<=n

det(A) = 0 iff det(row echelon form) = 0

> det(A^T) = det(A) 
