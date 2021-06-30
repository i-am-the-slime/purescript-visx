module VISX.Shape where

import Prelude
import Prim.Row (class Union)
import React.Basic (ReactComponent)
import React.Basic.Events (EventHandler)

foreign import barImpl ∷ ∀ r. ReactComponent { | r }

type BarProps =
  ( key ∷ String
  , x ∷ Number
  , y ∷ Number
  , width ∷ Number
  , height ∷ Number
  , fill ∷ String
  , onClick ∷ EventHandler
  )

bar ∷
  ∀ attrs attrs_.
  Union attrs attrs_ BarProps =>
  ReactComponent
    { width ∷ Number
    , height ∷ Number
    , x ∷ Number
    , y ∷ Number
    | attrs
    }
bar = barImpl
