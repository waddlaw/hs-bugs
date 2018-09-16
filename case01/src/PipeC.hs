{-# LANGUAGE MultiParamTypeClasses #-}
module PipeC
  ( pipeC
  ) where

import Type

pipeC :: MyType -> Format -> MyData -> IO MyData
pipeC mt fmt v = do
  res <- func3 mt fmt v
  writeFile "pipeC" res
  return res

class Func3 a b where
  func3 :: a -> b -> MyData -> IO MyData

instance Func3 MyType Format where
  func3 TypeA Csv  _ = pure ""
  func3 TypeB Csv  v = pure $ v ++ v
  func3 _     Html v = pure $ v ++ v