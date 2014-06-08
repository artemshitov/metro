module Metro.Types where

import Data.Text

data Color = Color Text deriving (Show, Eq)

data Line = Line {
  lineName   :: Text,
  lineNumber :: Int,
  lineColor  :: Color
} deriving (Show, Eq)

data Station = Station {
  stationLine :: Line,
  stationName :: Text
} deriving (Show, Eq)
