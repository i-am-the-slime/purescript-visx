module VISX.Interaction.Brush where

import Prelude
import React.Basic (ReactComponent)

foreign import brushImpl ∷ ∀ a. ReactComponent a
