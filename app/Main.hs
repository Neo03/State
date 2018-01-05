module Main where

--import Lib
import FizzBuzz
--main :: IO ()
--main = someFunc
main :: IO ()
main = mapM_ putStrLn $ fizzBuzzList [1..100]
