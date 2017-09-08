{-# OPTIONS_GHC -F -pgmF htfpp #-}

import Test.Framework
import Control.Monad.State

import Control.Monad.State.Upon

main :: IO ()
main = htfMain htf_thisModulesTests

test_upon = do
    assertEqual "yx" ([('y':)] `upon` "x")
    assertEqual "zyx" ([('y':), ('z':)] `upon` "x")

test_apply = do
    assertEqual "yx" $ execState (do { apply ('y':) }) "x"
    assertEqual "zyx" $ execState (do { apply ('y':) ; apply ('z':) }) "x"
