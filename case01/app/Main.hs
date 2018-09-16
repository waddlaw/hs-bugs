module Main (main) where

import PipeA
import PipeB
import PipeC
import Type

import System.Environment

main :: IO ()
main = do
  [mt, fmt, mode] <- getArgs

  let v = "secret"

  case mode of
    "all" -> pipelineAll (read mt) (read fmt) v
    "bc"  -> pipelineBC  (read mt) Html =<< readFile "pipeA"
    "c"   -> pipelineC   (read mt) (read fmt) =<< readFile "pipeB"

pipelineAll :: MyType -> Format -> MyData -> IO ()
pipelineAll mt fmt v = do
  resA <- pipeA mt fmt v
  resB <- pipeB mt fmt resA
  resC <- pipeC mt fmt resB

  return ()

pipelineBC :: MyType -> Format -> MyData -> IO ()
pipelineBC mt fmt resA = do
  resB <- pipeB mt fmt resA
  resC <- pipeC mt fmt resB

  return ()

pipelineC :: MyType -> Format -> MyData -> IO ()
pipelineC mt fmt resB = do
  resC <- pipeC mt fmt resB

  return ()