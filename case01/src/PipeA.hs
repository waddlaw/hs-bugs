{-# LANGUAGE MultiParamTypeClasses #-}
module PipeA
  ( pipeA
  ) where

import Type

pipeA :: MyType -> Format -> MyData -> IO MyData
pipeA mt fmt v = do
  res <- func1 mt fmt v
  writeFile "pipeA" res
  return res

class Func1 a b where
  func1 :: a -> b -> MyData -> IO MyData

instance Func1 MyType Format where
  func1 TypeA Csv  _ = pure ""
  func1 TypeB Csv  v = pure $ v ++ v
  func1 _     Html v = pure $ v ++ v