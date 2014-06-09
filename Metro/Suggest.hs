module Metro.Suggest (suggest) where

import Data.List

data SuggestResult a = SuggestResult Int a deriving (Show, Eq, Ord)

-- | Calculate string relevance based on search pattern.
-- It assigns each found char a relevance of 1 and grows
-- it exponentially if the found chars are adjacent.
score :: String -> String -> Int
score test target = rateAcc test target 1
  where rateAcc [] _ _ = 0
        rateAcc _ [] _ = 0
        rateAcc s@(x:xs) (y:ys) acc
          | x == y    = max (rateAcc xs ys (acc * 2) + acc) (rateAcc s ys 1)
          | otherwise = rateAcc s ys 1


-- | Provide a list of search suggestions sorted
-- descendingly by relevance
suggest :: Ord a => String -> [a] -> (a -> String) -> [SuggestResult a]
suggest test xs extractFn = sortDesc $ zipWith SuggestResult (map relevance xs) xs
  where sortDesc  = sortBy $ flip compare
        relevance = score test . extractFn
