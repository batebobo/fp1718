find :: (a -> Bool) -> [a] -> Maybe a
find _ [] = Nothing
find p (x:xs)
    |p x = Just x 
    |otherwise = find p xs

applyToMaybe :: (a -> b) -> Maybe a -> Maybe b
applyToMaybe _ Nothing = Nothing
applyToMaybe f (Just x) = Just (f x)

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

(applyToMaybe (+2) (find (>3) [1,2]))

type String = [Char]
type BookID = String

data Bool = True | False

data List a = Nil | Cons a (List a) deriving Show
-- deriving Show казва на компилатора да направи функцията
-- show :: a -> String
-- за нашия тип автоматично, (тя се ползва като искаме да принтим)

data Maybe l = Nothing | Just l

--foldl (:) [] 
