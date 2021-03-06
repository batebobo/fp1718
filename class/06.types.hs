-- one line comment
{-
   multi-line comment
   asdf
   qwerty
-}
-- За декларацията:
-- Функцията ни приема списък от неща (от тип [a])
-- и нещо (от тип а) и връща списък от неща ([a]).
-- Трябва обаче да подсигурим, че този тип може да бъде сравняван,
-- тъй като използваме (==). Това се случва чрез typeclass ограничение.
-- Непосредствено след :: изброяваме с какви типове може да работи нашата функция.
-- В случая сме длъжни да работим само с типове а, които могат да бъдат сравнявани.
-- Това значи и ограничението Eq a.
remove :: Eq a => [a] -> a -> [a]
remove [] _ = []
remove xs element = if (head xs) == element then  
  remove (tail xs) element
  else (head xs) : remove (tail xs) element

-- Втори вариант - използваме list comprehension
-- декларацията остава същата (все пак функцията ни прави същото нещо)
-- общият елемент на резултатният ни списък е `x`
-- след вертикалната черта (pipe) казваме откъде `x` последователно да приема стойности
-- в нашият случай това става от `xs`
-- след това изброяваме условия, които `x` трябва да удовлетворява, че да участва в резултатния списък
-- единственото ни условие в случая е `x` да е различен от търсения ни `element`
-- по този начин сме сигурни, че само различни от него елементи ще попаднат в резултата
remove' :: Eq a => [a] -> a -> [a]
remove' xs element = [x | x <- xs, x /= element]

-- Трети вариант - използваме вградената filter
-- вижте типа ѝ, изпълнявайки :t filter в ghci
-- накратко: приема функция и списък (както в Racket)
-- (/= element) всъщност е едноаргументна функция
-- това ще стане ясно след като прочетете глава 6 на Learn you a Haskell
remove'' :: Eq a => [a] -> a -> [a]
remove'' xs element = filter (/= element) xs

-- Последен вариант, обещавам. Използваме guards
-- guards са тези вертикални черти (pipe), които работят досущ като cond в Racket
-- тук започваме с шаблон - ако имаме празен списък, каквото и да искаме да махнем от него,
-- резултатът си остава празен списък
-- общият случай се покрива от втория шаблон - element (x:xs)
-- тук деконструираме списъка, с който е извикана функцията, на глава и опашка
-- в тялото на функцията `x` е първият елемент на списъка, а `xs` - останалите.
remove''' :: Eq a => [a] -> a -> [a]
remove''' [] _ = []
remove''' (x:xs) element 
  |x == element = remove''' xs element
  |otherwise = x : remove''' xs element 

-- Това сме го правили в Racket. Тук става доста по-лесно.
-- Декларацията ни казва, че очакваме списък от неща, които могат да бъдат подреждани
-- т.е. имат наредба помежду си - typeclass-ът Ord включва в себе си всички такива типове.
-- С всеки тип от Ord може да използваме функциите `>`, `<`, `>=`, `min` и т.н.
-- За повече информация, може да изпълните :info Ord
--
-- Първият шаблон се грижи за случая когато функцията е извикана с празен списък
-- Вторият - за всички останали (т.е. имаме непразен списък)
-- Казваме, че първият елемент на списъка ни ще се казва `pivot`, а опашката - `xs`.
-- Тук отново деконструираме списъка както при `remove`
-- Резултатът от функцията ни е (quicksort smaller) ++ [pivot] ++ (quicksort bigger)
-- като ++ конкатенира списъци.
-- използвайки `where` казваме какво зачат `smaller` и `bigger`, използвайки list comprehension-и
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (pivot:xs) = (quicksort smaller) ++ [pivot] ++ (quicksort bigger) -- (head xs)
    where smaller = [y | y <- xs, y < pivot]
          bigger = [y | y <- xs, y >= pivot]


-- Функция, която вмъква елемент в сортиран списък на "правилното" място
-- така че елементите преди него да са по-малки, а тези след него - по-големи
-- по този начин знаем, че списъкът остава сортиран след вмъкването
insert' :: Ord a => a -> [a] -> [a]
insert' y [] = [y]
insert' y (x:xs)
    |y <= x = y : x : xs
    |otherwise = x : insert' y xs

-- Сигнатурата на всички сортиращи функции трябва да изглежда така
-- foldr (както и в Racket) приема двуместна функция, с която комбинира стойности,
-- начална стойност (в случая - празен списък) и списък, който обхождаме
-- с това извикване на foldr, на всяка стъпка слагаме в резултатния списък (който в началото е празен нали)
-- текущото число
-- тъй като го слагаме с insert', знаем че резултатът ни ще е сортиран (заради свойството, което insert' изпълнява, а именно
-- запазва сортирането след вмъкване)
insertionSort :: Ord a => [a] -> [a]
insertionSort xs = foldr insert' [] xs

-- convert from Int to Double (or Float, or whatever is a (Num))
conv :: (Integral a) => a -> Double
conv x = (fromIntegral x) :: Double
-- с "fromIntegral" казваме че от "Integral" число искаме да направим някакво друго
-- и с ":: Double" казваме какъв му е типът (демек към какво искаме да го конвертираме)
--
--
-- signature for fromIntegral below
-- fromIntegral :: (Num b, Integral a) => a -> b

average' :: (Integral a) => [a] -> Double
average' xs = (conv (sum xs)) / (conv (length xs))

-- Първи начин да проверим дали число е просто
-- функцията null приема за аргумент списък и връща True, ако той е празен
-- С list comprehension-а правим списък на всички делители на n от 2 do n/2
-- Ако списъкът е празен, n e просто.
prime :: Int -> Bool
prime n = null [x | x <- [2..(n `div` 2)], x `divides` n]
    where divides x y = y `rem` x == 0

prime' :: Int -> Bool
prime' n = helper 2
    where helper k
             |k > n `div` 2 = True
             |n  `rem` k == 0 = False
             |otherwise = helper (k + 1)
