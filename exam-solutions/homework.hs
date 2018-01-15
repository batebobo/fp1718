import qualified Data.List.Unique as L
duplicateElements :: [a] -> [a]
duplicateElements [] = []
duplicateElements (x:xs) = x:x:duplicateElements xs

slice :: Int -> Int -> [a] -> [a]
slice _ _ [] = []
slice 0 end xs = take (end + 1) xs
slice start end (_:xs) = slice (start - 1) (end - 1) xs

slice' :: Int -> Int -> [a] -> [a]
slice' start end xs = take (end - start + 1) $ drop start xs

prime :: Int -> Bool
prime x = null [y | y<-[2..(x `div` 2)], y `divides` x]
    where divides x y = y `mod` x == 0

primesUntil :: Int -> [Int]
primesUntil n = [x | x <- [2..n], prime x]

primeSum' :: Int -> (Int,Int)
primeSum' x = head [(y,z) | y <- primesUntil x, z <- primesUntil x, y + z == x]

primeSum :: Int -> (Int, Int)
primeSum x = primeSum' x (primesUntil x)
    where primeSum' n (p:ps)
           |(n - p) `elem` ps = (p, (n - p))
           |otherwise = primeSum' n ps

hailstone :: Int -> [Int]
hailstone 1 = [1]
hailstone x
   |even x = x : hailstone (x `div` 2)
   |otherwise = x : hailstone (3*x + 1)

wot :: Int
wot = length $ L.unique $ filter (\x -> not (prime x) && odd x && x <= 99) [x + 2*y | x <- primesUntil 99, y <- map (^ 2) [1..10]]

divisors :: Int -> [(Int,Int)]
divisors x = histogram $ divisionSteps x (primesUntil x)
    where divisionSteps x l@(p:ps)
            |prime x = [x]
            |p `divides` x = p : divisionSteps (x `div` p) l
            |otherwise = divisionSteps x ps
          divides x y = y `mod` x == 0
          histogram [] = []
          histogram l@(x:xs) = (x, occurences x l) : histogram (remove x xs)
          occurences x = length . filter (== x)
          remove x = filter (/= x)

intercalate :: String -> [String] -> String
intercalate _ [] = ""
intercalate "" xs = concat xs
intercalate _ [x] = x
intercalate str (x:xs) = x ++ str ++ intercalate str xs

intercalate' :: [a] -> [[a]] -> [a]
intercalate' [] xs = concat xs
intercalate' _ [x] = x
intercalate' e (x:xs) = x ++ e ++ intercalate' e xs

data Tree a = Empty | Node a (Tree a) (Tree a) deriving Show

initialNodes :: [Int] -> [Tree Int]
initialNodes = map (\x -> (Node x Empty Empty))

combineNodes :: [Tree Int] -> [Tree Int]
combineNodes [] = []
combineNodes (left@(Node x _ _) : right@(Node y _ _) : xs) = (Node (x + y) left right) : combineNodes xs 

reduceToTree :: [Tree Int] -> Tree Int
reduceToTree [r] = r
reduceToTree l@(_:_:xs) = reduceToTree $ combineNodes l

fenwick :: [Int] -> Tree Int
fenwick = reduceToTree . initialNodes

