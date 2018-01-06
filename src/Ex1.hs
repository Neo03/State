module Ex1 where

import Control.Monad
import Control.Monad.Trans.State hiding (get, put, exec, eval, modify)

get :: State s s
get = state $ \s -> (s, s)

put :: s -> State s ()
put s = state $ const ((), s)


exec ::  State s a -> s -> s
exec m s = snd (runState m s)
--exec = undefined
--exec sa s = snd $ sa s

eval :: State s a -> s -> a
--eval (State sa)  = undefined
eval m s = fst (runState m s)

modify :: (s -> s) -> State s ()
modify f = state $ \s -> ((), f s) 
