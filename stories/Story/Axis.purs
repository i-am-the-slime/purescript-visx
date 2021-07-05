module Story.Axis (default, axis) where

import Prelude
import D3.Format as D3
import Data.Array (foldMap)
import Data.Array as Array
import Data.Function.Uncurried (mkFn2)
import Data.Newtype (ala)
import Data.Ord.Max (Max(..))
import Data.Traversable (for)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import React.Basic (JSX, element)
import React.Basic.DOM.SVG as R
import React.Basic.Hooks (Component, useEffect)
import React.Basic.Hooks as React
import VISX.Axis (axisBottom, axisLeft, labelProps)
import VISX.Scale (BandScale, LinearScale, bandwidth, scaleBand, scaleLinear, scaled)
import VISX.Shape as Shape
import VISX.Util.Data.MockData (letterFrequency)
import VISX.Util.SVG.Gradient (gradientTealBlueImpl)
import VISX.Util.SVG.Group (group) as VISX

default ∷ { title ∷ String }
default = { title: "Axis" }

axis ∷ Effect JSX
axis = mkExample <@> { width: 750.0, height: 280.0 }

mkExample ∷ Component { width ∷ Number, height ∷ Number }
mkExample = do
  let theData = letterFrequency
  let verticalMargin = 70.0
  let leftPadding = 50.0
  let
    mkBar { yMax, xScale, yScale } { letter, frequency } = do
      barWidth ← bandwidth xScale
      barHeight ← (yMax - _) <$> (yScale # scaled frequency)
      barX ← xScale # scaled letter
      let barY = yMax - barHeight
      pure
        $ element Shape.bar
            { width: barWidth
            , height: barHeight
            , x: barX
            , y: barY
            , fill: "rgba(120, 230, 250, 0.6)"
            }
  React.component "Bar Example" \{ width, height } → React.do
    let xMax = width - leftPadding
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
    let
      axisX =
        element axisBottom
          { top: yMax
          , scale: xScale
          , stroke: "rgba(200,200,200,0.5)"
          , display: "flex"
          , numTicks: Array.length theData
          , hideTicks: true
          , tickLabelProps:
              mkFn2 \_ _ →
                labelProps
                  { fill: "rgb(235,255,255)"
                  , fontFamily: "InterVariable, 'Comic Sans MS'"
                  , fontSize: "16px"
                  , textAnchor: "middle"
                  }
          }
      axisY =
        element axisLeft
          { scale: yScale
          , left: 50.0
          , top: 40.0
          , orientation: "left"
          , stroke: "rgba(255,255,255,0.9)"
          , tickStroke: "rgba(255,255,255,0.9)"
          , tickFormat: D3.format ".0%"
          , numTicks: 5
          , hideZero: true
          , tickLabelProps:
              mkFn2 \_ _ →
                labelProps
                  { fill: "rgb(235,255,255)"
                  , fontFamily: "InterVariable, 'Comic Sans MS'"
                  , fontSize: "14px"
                  , dominantBaseline: "middle"
                  , textAnchor: "end"
                  }
          }
    pure
      $ R.svg
          { width: show $ width + leftPadding
          , height: show height
          , children:
              [ element gradientTealBlueImpl { id: "bg-gradient" }
              , R.rect
                  { rx: "20"
                  , width: show $ width
                  , height: show height
                  , fill: "url(#bg-gradient)"
                  }
              , element VISX.group
                  { top: verticalMargin / 2.0
                  , left: leftPadding
                  , children: Array.snoc bars axisX
                  }
              , axisY
              ]
          }
