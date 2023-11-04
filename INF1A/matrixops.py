import numpy as np

def transpose(matrix):
    # check if the matrix dimensions are good.
    n = len(matrix[0])
    for i in matrix:
        if len(i) != n:
            print('dimensions incorrect')
            return ValueError
        
    # transpose by switching columns and rows
    newmatrix = np.zeros((len(matrix[0]), len(matrix)))
    for i in range(len(matrix)):
        for j in range(len(matrix[i])):
            newmatrix[j][i] = matrix[i][j]

    return newmatrix

def reverse(list):
    for i in range(1, len(list)):
        list[i-1], list[int(f'-{i}')] = list[int(f'-{i}')], list[i-1]
    return list

def inverse(matrix):
    if len(matrix) != len(matrix[0]):
        print('non invertible')
        return ValueError



print(transpose([[1, 2], [2, 1], [3, 2]]))
print(np.transpose([[1, 2], [2, 1], [3, 2]]))
print(reverse([3, 2, 1]))