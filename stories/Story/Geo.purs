module Story.Geo (default, geo) where

import Prelude
import Effect (Effect)
import Foreign (Foreign, unsafeToForeign)
import React.Basic (JSX, element)
import React.Basic.DOM.SVG as R
import React.Basic.Hooks (Component)
import React.Basic.Hooks as React
import Topojson.Client as TopoJson
import VISX.Layout.Geo (mercatorImpl)
import VISX.Util.SVG.Gradient (gradientTealBlue)
import VISX.Util.SVG.Group (group) as VISX

default ∷ { title ∷ String }
default = { title: "Geo" }

geo ∷ Effect JSX
geo = mkExample <@> { width: 340.0, height: 450.0 }

mkExample ∷ Component { width ∷ Number, height ∷ Number }
mkExample = do
  React.component "Bar Example" \{ width, height } → React.do
    let germany = TopoJson.feature germanyTopo "bundeslaender"
    let zoom = width * 5.0
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
                  { children:
                      [ element mercatorImpl
                          { data: germany.features
                          , scale: zoom
                          , translate: [ (-0.085) * zoom, zoom * 1.18 ]
                          , children:
                              \{ features } → do
                                (features ∷ Array _)
                                  <#> \{ feature, path } → do
                                      R.path
                                        { d: path
                                        , fill: "transparent"
                                        , stroke: "white"
                                        }
                          }
                      ]
                  }
              ]
          }

germanyTopo ∷ Foreign
germanyTopo =
  unsafeToForeign
    { "type": "Topology"
    , "arcs": [ [ [ 886, 108 ], [ -87, 46 ], [ -89, -19 ], [ -63, 57 ], [ -121, -92 ], [ -50, 11 ], [ -51, -22 ], [ -35, 47 ], [ 23, 119 ], [ -10, 56 ], [ 40, 79 ], [ 13, 96 ], [ 71, 89 ], [ 30, 58 ] ], [ [ 557, 633 ], [ 62, 126 ], [ -15, 108 ] ], [ [ 604, 867 ], [ 41, 10 ], [ 54, -51 ], [ 66, 40 ] ], [ [ 765, 866 ], [ 49, 25 ], [ 2, 45 ], [ 109, -19 ], [ 35, -61 ], [ 56, -63 ], [ -8, -74 ], [ 29, -55 ], [ 49, -43 ], [ -2, -102 ], [ -37, -56 ], [ -63, -22 ], [ 25, -157 ], [ -3, -142 ], [ -67, 1 ], [ -53, -35 ] ], [ [ 1431, 1186 ], [ 47, -43 ] ], [ [ 1478, 1143 ], [ 17, -76 ], [ 64, -44 ], [ 20, -35 ], [ -6, -82 ], [ 32, -97 ], [ 68, -32 ], [ 54, -78 ], [ 97, -66 ], [ 58, -74 ], [ -27, -98 ], [ -48, 30 ], [ -25, -83 ], [ -92, -44 ], [ -64, -54 ], [ 59, -101 ], [ 25, -81 ], [ -24, -65 ], [ -53, 43 ], [ -11, 38 ], [ -56, -19 ], [ -54, 37 ], [ -12, -45 ], [ -130, -9 ], [ -89, -59 ], [ -74, -4 ], [ -23, 45 ], [ -67, 12 ], [ -65, -102 ], [ -90, 90 ], [ -76, 18 ] ], [ [ 765, 866 ], [ 10, 59 ], [ -26, 65 ], [ -2, 77 ], [ 48, 14 ], [ 67, -22 ], [ -3, 46 ], [ 55, 33 ], [ 71, 82 ] ], [ [ 985, 1220 ], [ 39, 14 ], [ 78, -72 ], [ 20, -54 ], [ 50, 63 ], [ 67, -8 ], [ 61, 59 ], [ 38, -53 ], [ 93, 17 ] ], [ [ 1727, 2009 ], [ 83, 18 ], [ 28, -61 ], [ -11, -32 ], [ -89, 9 ], [ -11, 66 ] ], [ [ 2019, 2288 ], [ -18, -107 ], [ -46, -33 ], [ 16, -53 ], [ 93, -82 ], [ -18, -79 ], [ 37, -52 ], [ 11, -81 ], [ -33, -77 ], [ 32, -61 ], [ -4, -37 ] ], [ [ 2089, 1626 ], [ -88, -28 ], [ -45, 12 ], [ -42, -55 ], [ -50, -13 ], [ -126, 56 ], [ -38, 52 ] ], [ [ 1700, 1650 ], [ 27, 58 ], [ -49, 51 ], [ -61, 25 ], [ -39, -8 ], [ -76, 69 ], [ 25, 112 ], [ -42, 30 ], [ 20, 34 ], [ 0, 83 ], [ -61, 11 ], [ -90, 60 ] ], [ [ 1354, 2175 ], [ -77, 34 ] ], [ [ 1277, 2209 ], [ 63, 0 ], [ 146, 90 ], [ 148, -66 ], [ 169, 44 ], [ 49, 67 ], [ 127, -21 ], [ 40, -35 ] ], [ [ 736, 2212 ], [ -12, -43 ], [ -48, 8 ], [ -3, 57 ], [ 63, -22 ] ], [ [ 1051, 2331 ], [ -17, -14 ], [ -91, 16 ], [ -33, 46 ] ], [ [ 910, 2379 ], [ 86, 61 ], [ 55, -109 ] ], [ [ 961, 1548 ], [ 3, -28 ], [ 68, -47 ], [ -46, -63 ], [ 4, -47 ], [ -29, -59 ], [ 26, -23 ], [ -2, -61 ] ], [ [ 604, 867 ], [ 5, 52 ], [ -27, 95 ], [ -35, 23 ], [ -71, -24 ], [ 9, 89 ], [ 51, 26 ], [ -34, 85 ], [ 42, 39 ], [ -9, 33 ] ], [ [ 535, 1285 ], [ 2, 40 ], [ 53, 27 ], [ 94, 117 ], [ -31, 63 ], [ 96, 69 ], [ 31, -29 ], [ 66, 77 ] ], [ [ 846, 1649 ], [ 42, -6 ], [ 1, -84 ], [ 72, -11 ] ], [ [ 1277, 2209 ], [ -67, 81 ], [ -93, 15 ] ], [ [ 1117, 2305 ], [ 10, 35 ], [ 64, 41 ], [ -34, 69 ], [ 30, 76 ] ], [ [ 1187, 2526 ], [ 68, 23 ], [ 60, -40 ], [ 58, 92 ], [ 111, 18 ], [ 86, 65 ], [ 87, -1 ], [ 54, -24 ], [ 86, -71 ], [ 52, 12 ], [ 33, -63 ], [ 91, -21 ], [ -81, -42 ], [ 93, -30 ], [ 8, -75 ], [ 26, -81 ] ], [ [ 1786, 2803 ], [ 8, -44 ], [ 50, -83 ], [ -83, -43 ], [ -44, 22 ], [ 27, 67 ], [ 9, 76 ], [ 33, 5 ] ], [ [ 762, 2499 ], [ 62, -23 ], [ 45, -76 ], [ 41, -21 ] ], [ [ 1051, 2331 ], [ 66, -26 ] ], [ [ 1354, 2175 ], [ -66, -60 ], [ -76, 14 ], [ -54, -21 ], [ 37, -94 ], [ 38, -143 ], [ -27, -66 ], [ -67, -1 ], [ -27, -93 ], [ 30, -63 ] ], [ [ 1142, 1648 ], [ -61, -20 ], [ -64, -55 ], [ -56, -25 ] ], [ [ 846, 1649 ], [ 0, 56 ], [ -113, 178 ], [ 36, 58 ], [ -98, -7 ], [ -2, 41 ], [ -64, -20 ], [ 10, -112 ], [ -103, -35 ], [ -25, 43 ], [ -9, 77 ], [ -74, 1 ], [ -67, -45 ], [ -54, -8 ] ], [ [ 283, 1876 ], [ 2, 43 ], [ -86, 49 ], [ 1, 55 ], [ 81, 6 ], [ 8, 76 ], [ 38, 59 ], [ -2, 124 ], [ -53, 3 ], [ 0, 56 ], [ 38, 59 ], [ 199, 27 ], [ 34, -64 ], [ 74, 58 ], [ 17, 52 ], [ 109, 2 ], [ 19, 18 ] ], [ [ 535, 1285 ], [ -37, 55 ], [ -51, 18 ], [ -24, -43 ], [ -70, -46 ], [ -104, -36 ], [ -4, -29 ], [ -120, -57 ] ], [ [ 125, 1147 ], [ -33, 115 ], [ -62, 67 ], [ 21, 29 ], [ -51, 62 ], [ 65, 50 ], [ -16, 27 ], [ 36, 46 ], [ -3, 54 ], [ -60, 120 ], [ 76, 20 ], [ 46, -9 ], [ 84, 43 ], [ -33, 28 ], [ 88, 77 ] ], [ [ 557, 633 ], [ -69, 33 ], [ -63, -4 ], [ -72, 48 ] ], [ [ 353, 710 ], [ 11, 67 ], [ -34, 88 ], [ -56, 25 ], [ -68, -33 ], [ -86, -4 ] ], [ [ 120, 853 ], [ 33, 94 ], [ -67, 36 ], [ -28, 88 ], [ 67, 76 ] ], [ [ 353, 710 ], [ -49, -20 ], [ -53, 39 ], [ -46, -22 ], [ -48, 102 ], [ -37, 44 ] ], [ [ 1700, 1650 ], [ -194, -34 ], [ -11, -134 ], [ 24, -42 ] ], [ [ 1519, 1440 ], [ -60, -45 ], [ -112, 55 ], [ -39, 45 ], [ -2, 55 ], [ -96, 12 ], [ -31, 82 ], [ -37, 4 ] ], [ [ 2089, 1626 ], [ 58, -50 ], [ 17, -54 ], [ -12, -88 ], [ -47, -96 ], [ -32, 8 ], [ -46, 70 ], [ -18, -55 ], [ -122, -63 ], [ -73, -3 ], [ -83, -81 ], [ -52, -33 ], [ -31, 16 ], [ -78, -21 ], [ -57, -62 ], [ -35, 29 ] ], [ [ 1431, 1186 ], [ 55, 80 ], [ 35, 8 ], [ -13, 60 ], [ 93, 35 ], [ -31, 60 ], [ -51, 11 ] ], [ [ 762, 2499 ], [ -63, 52 ], [ 4, 92 ], [ -59, 10 ], [ 68, 112 ], [ -66, 97 ], [ 49, 29 ], [ 102, -26 ], [ 168, -26 ], [ 17, -87 ], [ 26, -25 ], [ 154, -66 ], [ 66, 18 ], [ 5, -59 ], [ -80, -63 ], [ 34, -31 ] ] ]
    , "transform": { "scale": [ 0.0042313540390929395, 0.002633829269254504 ], "translate": [ 5.87203884612277, 47.30230731335657 ] }
    , "objects":
        { "bundeslaender":
            { "type": "GeometryCollection"
            , "geometries":
                [ unsafeToForeign { "arcs": [ [ 0, 1, 2, 3 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 1, "NAME_1": "Baden-Württemberg", "NL_NAME_1": "", "VARNAME_1": "", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 4, 5, -4, 6, 7 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 2, "NAME_1": "Bayern", "NL_NAME_1": "", "VARNAME_1": "Bavaria", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 8 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 3, "NAME_1": "Berlin", "NL_NAME_1": "", "VARNAME_1": "", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 9, 10, 11, 12, 13 ], [ -9 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 4, "NAME_1": "Brandenburg", "NL_NAME_1": "", "VARNAME_1": "", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 14 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 5, "NAME_1": "Bremen", "NL_NAME_1": "", "VARNAME_1": "", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 15, 16 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 6, "NAME_1": "Hamburg", "NL_NAME_1": "", "VARNAME_1": "", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 17, -7, -3, 18, 19, 20 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 7, "NAME_1": "Hessen", "NL_NAME_1": "", "VARNAME_1": "Hesse", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ [ -14, 21, 22, 23 ], [ 24 ] ] ], "type": "MultiPolygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 8, "NAME_1": "Mecklenburg-Vorpommern", "NL_NAME_1": "", "VARNAME_1": "Mecklenburg-West Pomerania", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 25, -16, 26, -22, -13, 27, 28, -21, 29, 30 ], [ -15 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 9, "NAME_1": "Niedersachsen", "NL_NAME_1": "", "VARNAME_1": "Lower Saxony", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ -20, 31, 32, -30 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 10, "NAME_1": "Nordrhein-Westfalen", "NL_NAME_1": "", "VARNAME_1": "North Rhine-Westphalia", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ -19, -2, 33, 34, 35, -32 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 11, "NAME_1": "Rheinland-Pfalz", "NL_NAME_1": "", "VARNAME_1": "Rhineland-Palatinate", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 36, -35 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 12, "NAME_1": "Saarland", "NL_NAME_1": "", "VARNAME_1": "", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ 37, 38, -28, -12 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 13, "NAME_1": "Sachsen-Anhalt", "NL_NAME_1": "", "VARNAME_1": "Saxony-Anhalt", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ -11, 39, -5, 40, -38 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 14, "NAME_1": "Sachsen", "NL_NAME_1": "", "VARNAME_1": "Saxony", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ -23, -27, -17, -26, 41 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 15, "NAME_1": "Schleswig-Holstein", "NL_NAME_1": "", "VARNAME_1": "", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                , unsafeToForeign { "arcs": [ [ -41, -8, -18, -29, -39 ] ], "type": "Polygon", "properties": { "ID_0": 86, "ISO": "DEU", "NAME_0": "Germany", "ID_1": 16, "NAME_1": "Thüringen", "NL_NAME_1": "", "VARNAME_1": "Thuringia", "TYPE_1": "Land", "ENGTYPE_1": "State" } }
                ]
            }
        }
    }
