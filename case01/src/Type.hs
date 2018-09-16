module Type where

data MyType
  = TypeA
  | TypeB
  deriving (Eq, Show, Read)

data Format
  = Csv
  | Html
  deriving (Eq, Show, Read)

type MyData = String