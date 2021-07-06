-- [TODO] Specify props
module VISX.Util.SVG.Gradient where

import React.Basic (ReactComponent)

foreign import linearGradient ∷ ∀ a. ReactComponent { id ∷ String, from ∷ String, to ∷ String | a }

foreign import radialGradient ∷ ∀ a. ReactComponent { id ∷ String, from ∷ String, to ∷ String | a }

foreign import gradientDarkgreenGreen ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientLightgreenGreen ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientOrangeRed ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPinkBlue ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPinkRed ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPurpleOrange ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPurpleRed ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPurpleTeal ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientSteelPurple ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientTealBlue ∷ ∀ a. ReactComponent { id ∷ String | a }
