{-# LANGUAGE OverloadedStrings #-}

module Metro.Data (
  Metro.Data.lines,
  module Metro.Types
) where

import Data.Map
import Metro.Types

lines = fromList [
  ("SOK", Line "Сокольническая" 1 (Color "#001122")),
  ("ZAM", Line "Замоскворецкая" 1 (Color "#001122")),
  ("ARB", Line "Арбатско-Покровская" 1 (Color "#001122")),
  ("FIL", Line "Филёвская" 1 (Color "#001122")),
  ("KOL", Line "Кольцевая" 1 (Color "#001122")),
  ("KLR", Line "Калужско-Рижская" 1 (Color "#001122")),
  ("TAG", Line "Таганско-Краснопресненская" 1 (Color "#001122")),
  ("KLN", Line "Калининская" 1 (Color "#001122")),
  ("SER", Line "Серпуховско-Тимирязевская" 1 (Color "#001122")),
  ("LUB", Line "Люблинско-Дмитровская" 1 (Color "#001122")),
  ("KAH", Line "Каховская" 1 (Color "#001122")),
  ("BUT", Line "Бутовская" 1 (Color "#001122"))
  ]
