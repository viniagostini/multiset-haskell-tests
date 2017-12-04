import qualified Data.List as List

--FIXME: adaptar construtor para receber uma lista de elementos do tipo "a" e aí sim montar a Bag.
data Bag [a] = Bag [(a, Int)] deriving (Eq, Show)

{-
 - Insere um elemento na estrutura. Caso o elemento ja existe, sua quantidade na estrutura sera incrementada.
 -}
insert2 e (Bag []) = [(e, 1)]
insert2 e (Bag (x:xs)) 
  |(fst x == e) = [(fst x, (snd x)+1)] ++ xs
  |otherwise = [x] ++ (insert2 e (Bag xs))

insert e bag = Bag (insert2 e bag) 

{-
- Remove um elemento da estrutura, levando em consideracao a manipulacao de sua quantidade na estrutura. 
- Caso a quantidade atinja 0 (ou menos), o elemento deve realmente ser removido da estrutura
-}
remove2 e (Bag []) = []
remove2 e (Bag (x:xs))
  |(fst x == e) = 
    if((snd x) == 1) then 
      xs
    else  
      [(fst x, (snd x)-1)] ++ xs
  |otherwise = [x] ++ (remove2 e (Bag xs))

remove e bag = Bag (remove2 e bag) 

{-
 - Busca um elemento na estrutura retornando sua quantidade. Caso o elemento nao exista, retorna 0 como a quantidade.
-}
search e (Bag []) = 0
search e (Bag (x:xs)) 
  |(fst x == e) = (snd x)
  |otherwise = (search e (Bag xs))

{-
 - Faz a uniao deste Bag com otherBag. A uniao consiste em ter os elementos dos dois Bags com suas maiores quantidades.
 - Por exemplo, A = {(a,1),(c,3)}, B = {(b,2),(c,1)}. A.union(B) deixa A = {(a,1),(c,3),(b,2)}
-}
union (Bag []) (Bag ys) = ys
union (Bag (x:xs)) (Bag ys) = 
  let elementInBag2 = search (fst x) (Bag ys) in
  if (snd x) > elementInBag2 then 
    [x] ++ union (Bag xs) (Bag (filter (\tup -> (fst tup) /= (fst x)) ys))
  else
    union (Bag xs) (Bag ys)


{-
 - Faz a intersecao deste Bag com otherBag. A intersecao consiste em ter os elementos que estao em ambos os bags com suas 
 - menores quantidades. Por exemplo, Seja A = {(a,3),(b,1)} e B = {(a,1)}. Assim, A.intersection(B) deixa A = {(a,1)}
 - Caso senhum elemento de A esteja contido em B entao a intersecao deixa A vazio.
-}
intersection2 (Bag []) (Bag ys) = []
intersection2 (Bag xs) (Bag []) = []
intersection2 (Bag (x:xs)) (Bag ys) = 
  let elementInBag2 = search (fst x) (Bag ys) in
  if elementInBag2 > 0 then 
    if elementInBag2 > (snd x) then
      [x] ++ intersection2 (Bag xs) (Bag (filter (\tup -> (fst tup) /= (fst x)) ys))
    else 
      [(fst x, elementInBag2)] ++ intersection2 (Bag xs) (Bag (filter (\tup -> (fst tup) /= (fst x)) ys))
  else
    intersection2 (Bag xs) (Bag ys)
 
intersection bag1 bag2 =  Bag (intersection2 bag1 bag2)



{-
 - Faz a diferenca deste Bag com otherBag. A diferenca A \ B entre bags eh definida como segue:
   - contem os elementos de A que nao estao em B
   - contem os elementos x de A que estao em B mas com sua quantidade subtraida (qtde em A - qtde em B). 
     Caso essa quantidade seja negativa o elemento deve serremovido do Bag. 
     Por exemplo, seja A = {(a,3),(b,1)} e B = {(b,2),(a,1)}. Assim, A.minus(B) deixa A = {(a,2)}.
-}
minus2 (Bag []) (Bag ys) = []
minus2 (Bag xs) (Bag []) = xs
minus2 (Bag (x:xs)) (Bag ys) = 
  let elementInBag2 = search (fst x) (Bag ys) 
      differenceBetweenElements = (snd x) - elementInBag2 in
  if differenceBetweenElements > 0 then
    [(fst x, differenceBetweenElements)] ++ minus2 (Bag xs) (Bag (filter (\tup -> (fst tup) /= (fst x)) ys))
  else
    minus2 (Bag xs) (Bag ys)

minus bag1 bag2 = Bag (minus2 bag1 bag2)


{-
 - Testa se este Bag esta incluso em otherBag. Para todo elemento deste bag, sua quantidade
 - deve ser menor or igual a sua quantidade em otherBag.
-}
inclusion (Bag xs) (Bag []) = False
inclusion (Bag []) (Bag ys) = True
inclusion (Bag (x:xs)) (Bag ys) = 
  let elementInBag2 = search (fst x) (Bag ys) in
  if elementInBag2 >= (snd x) then
    inclusion (Bag  xs) (Bag ys)
  else
    False


{-
 - Realiza a soma deste Bag com otherBag. A soma de dois bags contem os elementos dos dois bags com suas quantidades somadas. 
-}
sum2 (Bag []) (Bag ys) = ys
sum2 (Bag (x:xs)) (Bag ys) = 
  let elementInBag2 = search (fst x) (Bag ys) 
      sumElements = (snd x) + elementInBag2 in
  [(fst x, sumElements)] ++ sum2 (Bag xs) (Bag (filter (\tup -> (fst tup) /= (fst x)) ys))

sumy bag1 bag2 = Bag (sum2 bag1 bag2)


{-
 - Retorna a quantidade total de elementos no Bag
-}
size (Bag []) = 0
size (Bag xs) = foldl (\a (b, c) ->  a + c) 0 xs

main = 
  do
  print $ sumy ( Bag [('a',10),('b',1)] )  ( Bag [('a',10),('b',1)] )  
