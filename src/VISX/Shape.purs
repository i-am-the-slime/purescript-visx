module VISX.Shape where

import Prelude
import Prim.Row (class Union)
import React.Basic (ReactComponent)
import React.Basic.Events (EventHandler)
import VISX.Curve (CurveType)

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

foreign import linePathImpl ∷ ∀ r. ReactComponent { | r }

type LinePathProps a =
  ( key ∷ String
  , x ∷ Number
  , y ∷ Number
  , width ∷ Number
  , height ∷ Number
  , fill ∷ String
  , onClick ∷ EventHandler
  , curve ∷ CurveType
  , data ∷ Array a
  , stroke ∷ String
  , strokeWidth ∷ Number
  , strokeOpacity ∷ Number
  , shapeRendering ∷ String
  , markerMid ∷ String
  , markerStart ∷ String
  , markerEnd ∷ String
  )

linePath ∷
  ∀ a attrs attrs_.
  Union attrs attrs_ (LinePathProps a) =>
  ReactComponent
    { width ∷ Number
    , height ∷ Number
    , x ∷ Number
    , y ∷ Number
    , data ∷ Array a
    , curve ∷ CurveType
    | attrs
    }
linePath = linePathImpl
