module Story.Bar (default, bar) where

import Prelude

import D3.TimeFormat (timeFormat)
import Data.Array (foldMap)
import Data.Newtype (ala)
import Data.Ord.Max (Max(..))
import Data.Traversable (for)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import React.Basic (JSX, element)
import React.Basic.DOM.SVG as R
import React.Basic.Hooks (Component, useEffect)
import React.Basic.Hooks as React
import VISX.Scale (BandScale, LinearScale, bandwidth, scaleBand, scaleLinear, scaled)
import VISX.Shape as Shape
import VISX.Util.Data.MockData (letterFrequency)
import VISX.Util.SVG.Gradient (gradientTealBlue)
import VISX.Util.SVG.Group (group) as VISX

default ∷ { title ∷ String }
default = { title: "Bar" }

bar ∷ Effect JSX
bar = do
  let _ = timeFormat ""
  mkExample <@> { width: 700.0, height: 400.0 }

mkExample ∷ Component { width ∷ Number, height ∷ Number }
mkExample = do
  let theData = letterFrequency
  let verticalMargin = 70.0
  let
    mkBar { yMax, xScale, yScale } { letter, frequency } = do
      barWidth ← bandwidth xScale
      let barHeight = (yMax - _) $ (yScale # scaled frequency)
      let barX = xScale # scaled letter
      let barY = yMax - barHeight
      pure
        $ element Shape.barRounded
            { width: barWidth
            , height: barHeight
            , x: barX
            , y: barY
            , radius: 4
            , top: 2
            , fill: "rgba(120, 230, 250, 0.6)"
            }
  React.component "Bar Example" \{ width, height } → React.do
    let xMax = (width ∷ Number)
    let yMax = height - verticalMargin
    xScale ∷ BandScale String Number ←
      React.useMemo xMax \_ →
        scaleBand
          { domain: theData <#> _.letter
          , range: 0.0 /\ xMax
          , round: true
          , padding: 0.4
          }
    yScale ∷ LinearScale Number Number ←
      React.useMemo yMax \_ →
        scaleLinear
          { domain: 0.0 /\ (theData <#> _.frequency # ala Max foldMap)
          , range: yMax /\ 0.0
          , round: true
          }
    bars /\ setBars ← React.useState' []
    useEffect { width, height } do
      setBars =<< for theData (mkBar { yMax, xScale, yScale })
      mempty
    pure
      $ R.svg
          { width: show width
          , height: show height
          , children:
              [ element gradientTealBlue { id: "bg-gradient" }
              , R.rect
                  { rx: "20"
                  , width: show width
                  , height: show height
                  , fill: "url(#bg-gradient)"
                  }
              , element VISX.group
                  { top: verticalMargin / 2.0
                  , children: bars
                  }
              ]
          }
