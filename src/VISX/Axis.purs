module VISX.Axis
  ( LabelProps
  , DefaultAxisProps
  , AxisProps
  , AxisRendererProps
  , TickRendererProps
  , axis
  , axisBottom
  , labelProps
  , axisLeft
  , axisRight
  , axisTop
  ) where

import D3.Format (D3Format)
import Effect (Effect)
import Prim.Row (class Union)
import React.Basic (JSX, ReactComponent)
import React.Basic.DOM.SVG (Props_text)
import Unsafe.Coerce (unsafeCoerce)
import VISX.Scale (class Scale)

type AxisRendererProps =
  {}

type TickRendererProps =
  {}

foreign import data LabelProps ∷ Type

labelProps ∷ ∀ attrs attrs_. Union attrs attrs_ Props_text => { | attrs } -> LabelProps
labelProps = unsafeCoerce

type AxisProps r =
  ( scale ∷ ∀ scale. scale
  , axisClassName ∷ String
  , axisLineClassName ∷ String
  , children ∷ AxisRendererProps -> JSX
  , hideAxisLine ∷ Boolean
  , hideTicks ∷ Boolean
  , hideZero ∷ Boolean
  , label ∷ String
  , labelClassName ∷ String
  , labelOffset ∷ Number
  , labelProps ∷ LabelProps
  , left ∷ Number
  , numTicks ∷ Int
  , orientation ∷ String
  , rangePadding ∷ Number
  , stroke ∷ String
  , strokeDasharray ∷ String
  , strokeWidth ∷ String
  , tickClassName ∷ String
  , tickComponent ∷ TickRendererProps -> JSX
  , tickFormat ∷ D3Format
  , tickLabelProps ∷ Effect LabelProps -- TODO proper not sure this is really an effect
  , tickLength ∷ Number
  , ticksComponent ∷ TickRendererProps -> JSX
  , tickStroke ∷ String
  , tickTransform ∷ String
  -- , tickValues :: NoIdea
  , top ∷ Number
  | r
  )

type DefaultAxisProps =
  AxisProps ( width ∷ String, height ∷ String, display ∷ String )

axis ∷ ∀ scale attrs attrs_. Scale scale => Union attrs attrs_ (AxisProps ()) => ReactComponent { scale ∷ scale | attrs }
axis = axisImpl

axisLeft ∷ ∀ scale attrs attrs_. Scale scale => Union attrs attrs_ DefaultAxisProps => ReactComponent { scale ∷ scale | attrs }
axisLeft = axisLeftImpl

axisTop ∷ ∀ scale attrs attrs_. Scale scale => Union attrs attrs_ DefaultAxisProps => ReactComponent { scale ∷ scale | attrs }
axisTop = axisTopImpl

axisRight ∷ ∀ scale attrs attrs_. Scale scale => Union attrs attrs_ DefaultAxisProps => ReactComponent { scale ∷ scale | attrs }
axisRight = axisRightImpl

axisBottom ∷ ∀ scale attrs attrs_. Scale scale => Union attrs attrs_ DefaultAxisProps => ReactComponent { scale ∷ scale | attrs }
axisBottom = axisBottomImpl

foreign import axisImpl ∷ ∀ a. ReactComponent { | a }

foreign import axisTopImpl ∷ ∀ a. ReactComponent { | a }

foreign import axisBottomImpl ∷ ∀ a. ReactComponent { | a }

foreign import axisLeftImpl ∷ ∀ a. ReactComponent { | a }

foreign import axisRightImpl ∷ ∀ a. ReactComponent { | a }
