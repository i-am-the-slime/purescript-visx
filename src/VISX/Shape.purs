module VISX.Shape (bar, barRounded, linePath) where

import Prim.Row (class Union)
import React.Basic (ReactComponent)
import React.Basic.Events (EventHandler)
import VISX.Curve (CurveType)

type BarPropsCommon r
  = ( key ∷ String
    , x ∷ Number
    , y ∷ Number
    , width ∷ Number
    , height ∷ Number
    , fill ∷ String
    , onClick ∷ EventHandler
    | r
    )

type BarProps
  = BarPropsCommon ()

foreign import barImpl ∷ ∀ r. ReactComponent { | r }

bar ∷
  ∀ attrs attrs_.
  Union attrs attrs_ BarProps ⇒
  ReactComponent
    { width ∷ Number
    , height ∷ Number
    , x ∷ Number
    , y ∷ Number
    | attrs
    }
bar = barImpl

foreign import barRoundedImpl ∷ ∀ r. ReactComponent { | r }

type BarRoundedProps
  = BarPropsCommon ( all ∷ Int
    , top ∷ Int
    , right ∷ Int
    , bottom ∷ Int
    , left ∷ Int
    , topRight ∷ Int
    , bottomRight ∷ Int
    , bottomLeft ∷ Int
    , topLeft ∷ Int
    )

barRounded ∷
  ∀ attrs attrs_.
  Union attrs attrs_ BarRoundedProps ⇒
  ReactComponent
    { width ∷ Number
    , height ∷ Number
    , x ∷ Number
    , y ∷ Number
    | attrs
    }
barRounded = barRoundedImpl

foreign import linePathImpl ∷ ∀ r. ReactComponent { | r }

type LinePathProps a
  = ( key ∷ String
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
  Union attrs attrs_ (LinePathProps a) ⇒
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
