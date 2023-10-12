import Debug.Trace

main :: IO ()
main = print $ trace ("Taking 2 from [0..]: " ++ show (take 2 [0..])) (take 2 [0..])