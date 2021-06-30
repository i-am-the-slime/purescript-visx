-- [TODO] Specify props
module VISX.Util.SVG.Gradient where

import React.Basic (ReactComponent)

foreign import linearGradientImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import radialGradientImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientDarkgreenGreenImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientLightgreenGreenImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientOrangeRedImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPinkBlueImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPinkRedImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPurpleOrangeImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPurpleRedImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientPurpleTealImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientSteelPurpleImpl ∷ ∀ a. ReactComponent { id ∷ String | a }

foreign import gradientTealBlueImpl ∷ ∀ a. ReactComponent { id ∷ String | a }
