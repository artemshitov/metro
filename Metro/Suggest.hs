module Metro.Suggest (suggest, suggestBy) where

import Data.List

data SuggestResult a = SuggestResult Int a deriving (Show, Eq, Ord)

-- | Calculate string relevance based on search pattern.
-- It assigns each found char a relevance of 1 and grows
-- it exponentially if the found chars are adjacent.
score :: String -> String -> Int
score test target = scoreAcc test target 1
  where scoreAcc [] _ _ = 0
        scoreAcc _ [] _ = 0
        scoreAcc s@(x:xs) (y:ys) acc
          | x == y    = max (scoreAcc xs ys (acc * 2) + acc) (scoreAcc s ys 1)
          | otherwise = scoreAcc s ys 1


-- | Provide a list of search suggestions sorted
-- descendingly by relevance
suggestBy :: Ord a => String -> [a] -> (a -> String) -> [SuggestResult a]
suggestBy test xs extractFn = sortDesc $ zipWith SuggestResult (map relevance xs) xs
  where sortDesc  = sortBy $ flip compare
        relevance = score test . extractFn

suggest :: String -> [String] -> [SuggestResult String]
suggest test xs = suggestBy test xs id
