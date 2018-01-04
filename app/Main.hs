module Main where

--import Lib
import FizzBuzz
--main :: IO ()
--main = someFunc
main :: IO ()
main = mapM_ (putStrLn . fizzBuzz) [1..100]
