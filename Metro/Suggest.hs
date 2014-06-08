module Metro.Suggest where

data SuggestResult a = SuggestResult a Int

-- | Calculate string relevance based on search pattern.
-- It assigns each found char a relevance of 1 and grows
-- it exponentially if the found chars are adjacent.
rate :: String -> String -> Int
rate pattern target = rateAcc pattern target 1
  where rateAcc [] _ _ = 0
        rateAcc _ [] _ = 0
        rateAcc s@(x:xs) (y:ys) acc
          | x == y    = max (rateAcc xs ys (acc * 2) + acc) (rateAcc s ys 1)
          | otherwise = rateAcc s ys 1

-- suggest :: [String] -> String -> [SuggestResult]
