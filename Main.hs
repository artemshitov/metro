{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Text
import Data.Map
import Metro.Data as D

main = putStrLn $ unpack . lineName $ (D.lines ! "SOK")
