module Main where

import           Aoc.Class
import           Aoc.Day.One.Solution
import           Aoc.Input
import           Aoc.Types

import           Control.Monad        (forM_)
import           System.Environment   (getArgs)


printSolutions :: (Show a, Show b) => AocDay -> (a, b) -> IO ()
printSolutions day (p1, p2) = putStrLn $ mconcat
  [ "Solutions for day " <> show (toInt day) <> "\n"
  , "Part I:  " <> show p1 <> "\n"
  , "Part II: " <> show p2
  ]

solve :: AocDay -> IO ()
solve day
  | toInt day == 1 = solve' dayOne
  | otherwise = error $ "No solution for day " <> show day
  where
    solve' :: (Aoc a, Result a ~ (b, c), Show b, Show c) => a -> IO ()
    solve' sln = inputForDay day >>= solution sln >>= printSolutions day

main :: IO ()
main = do
  args <- getArgs
  if null args
    then putStrLn "Missing required argument 'day:int'"
    else forM_ (parseDay $ head args) solve
