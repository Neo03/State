{-# LANGUAGE InstanceSigs #-}

module Moi where
import Data.Monoid

newtype Moi s a = Moi {runMoi :: s -> (a, s) }


instance Functor (Moi s) where
  fmap :: (a -> b) -> Moi s a -> Moi s b
  fmap f (Moi g) = Moi $ \s -> let (a, b) = g s
                                in (f a, b)

instance  Applicative (Moi s) where
  pure :: a -> Moi s a
  pure a = Moi $ \s -> (a, s)
  (<*>) :: Moi s (a -> b) -> Moi s a -> Moi s b
  (Moi f) <*> (Moi g) = Moi $ \s -> let (a, b) = f s
                                        (c, d) = g s
                                    in (a c, d)

instance Monad (Moi s) where
  return = pure
  (>>=) :: Moi s a -> (a -> Moi s b) -> Moi s b
  (Moi f) >>= g = Moi $ \s -> let (a, b) = f s
                              in  runMoi(g a) b
