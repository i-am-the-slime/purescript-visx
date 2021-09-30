module VISX.Interaction.Brush where

import React.Basic (ReactComponent)

foreign import brushImpl ∷ ∀ a. ReactComponent a

foreign import baseBrushImpl ∷ ∀ a. ReactComponent a
foreign import baseBrushStateImpl ∷ ∀ a. ReactComponent a
foreign import baseBrushUpdateImpl ∷ ∀ a. ReactComponent a
