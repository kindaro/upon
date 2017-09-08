module Control.Monad.State.Upon where

import Control.Monad.State

upon :: [state -> state] -> state -> state
actions `upon` state = execState (sequence $ apply <$> actions) state

apply action = get >>= put . action
