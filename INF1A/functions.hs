fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci x = fibonacci (x-1) + fibonacci (x-2)

squaresRec :: [Int] -> [Int]
squaresRec [] = []
squaresRec (x:xs) = x * x : squaresRec xs
