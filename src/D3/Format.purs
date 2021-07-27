module D3.Format where

import Prelude
import Unsafe.Coerce (unsafeCoerce)
import Effect (Effect)
import Data.Int (toNumber)

foreign import data D3Format ∷ Type

foreign import format ∷ String → D3Format

formatNumber ∷ D3Format → Number → Effect String
formatNumber formatFn n =
  pure $ ((unsafeCoerce formatFn) ∷ Number → String) n

formatInt ∷ D3Format → Int → Effect String
formatInt formatFn i =
  pure $ ((unsafeCoerce formatFn) ∷ Number → String) (toNumber i)
