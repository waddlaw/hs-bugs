{-# LANGUAGE MultiParamTypeClasses #-}
module PipeB
  ( pipeB
  ) where

import Type

pipeB :: MyType -> Format -> MyData -> IO MyData
pipeB mt fmt v = do
  res <- func2 mt fmt v
  writeFile "pipeB" res
  return res

class Func2 a b where
  func2 :: a -> b -> MyData -> IO MyData

instance Func2 MyType Format where
  func2 TypeA Csv  _ = pure ""
  func2 TypeB Csv  v = pure ""
  func2 _     Html v = pure $ v ++ v