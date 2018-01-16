-- Вариант 1
-- Зад.1
--
-- с fromIntegral правим списъка от 1 до n, но с Double числа.
-- няма да се заяждам за fromIntegral частта.
pie :: Int -> Double
pie n = 4 * sum [doStuff k | k <- [1..(fromIntegral n)]]
    where doStuff t = ((-1) ** (t + 1)) * (1 / (2 * t - 1))

-- Зад.2
-- Тук ни трябва Eq a, защото в count и remove сравняваме с (==) и (/=)
listToBag :: Eq a => [a] -> [(a, Int)] 
listToBag [] = []
listToBag lst@(x:xs) = (x, count x lst) : listToBag (remove x lst)
    where count x = length . (filter (== x))
          remove x = filter (/= x)

bagElem :: Eq a => a -> [(a, Int)] -> Bool
bagElem _ [] = False
bagElem a ((value,_):rest)
    |a == value = True
    |otherwise = bagElem a rest
-- или
-- bagElem a bag = a `elem` (map fst bag)

bagEqual :: Eq a => [(a, Int)] -> [(a, Int)] -> Bool
bagEqual [] [] = True
bagEqual _ [] = False
bagEqual [] _ = False
bagEqual (x:xs) ys = x `elem` ys && bagEqual xs (removeOnce x ys)
        where removeOnce x xs = takeWhile (/= x) xs ++ tail (dropWhile (/= x) xs) 

bagUnion :: Eq a => [(a, Int)] -> [(a, Int)] -> [(a, Int)]
bagUnion xs ys = reduce (xs ++ ys)
   where reduce [] = []
         reduce (x:xs)
           |(fst x) `bagElem` xs && (snd x) <= snd (find x xs) = reduce xs
           |otherwise = x : reduce (remove x xs)
         find _ [] = error "wtf?"
         find t (z:zs)
           |(fst t) == (fst z) = z
           |otherwise = find t zs
         remove x = filter (\y -> (fst y) /= (fst x))

-- Зад.3
bools :: Int -> [[Bool]]
bools 0 = []
bools 1 = [[True], [False]]
bools n = [True:x | x <- bools (n - 1)] ++ [False:x | x <- bools (n - 1)]

-- Зад.4
myFilterMapAnd :: [a -> Bool] -> [a] -> [a]
myFilterMapAnd _ [] = []
myFilterMapAnd [] x = x
myFilterMapAnd (p:ps) xs = myFilterMapAnd ps (filter p xs)


-- Вариант 2
-- Зад.1
pie' :: Int -> Double
pie' n = 2 * product [(2 * k) / (2 * k - 1) * (2 * k) / (2 * k + 1) | k <- [1..(fromIntegral n)]]

-- Зад.3
numbers :: Int -> [[Int]]
numbers 0 = []
numbers 1 = [[0],[1],[2]]
numbers n = concat [[0:x,1:x,2:x] | x <- numbers (n - 1)]

-- Зад.4
myFilterMapOr :: [a -> Bool] -> [a] -> [a]
myFilterMapOr _ [] = []
myFilterMapOr ps (x:xs)
    |or' ps x = x : myFilterMapOr ps xs
    |otherwise = myFilterMapOr ps xs
      where or' [] _ = False
            or' (p:ps) x
             |p x = True
             |otherwise = or' ps x
