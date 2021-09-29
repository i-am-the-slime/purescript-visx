module D3.Format where

import Prelude
import Data.Int (toNumber)
import Data.JSDate (JSDate)
import Effect (Effect)
import Unsafe.Coerce (unsafeCoerce)

foreign import data D3Format ∷ Type

foreign import format ∷ String → D3Format

formatNumber ∷ D3Format → Number → Effect String
formatNumber formatFn n =
  pure $ ((unsafeCoerce formatFn) ∷ Number → String) n

formatInt ∷ D3Format → Int → Effect String
formatInt formatFn i =
  pure $ ((unsafeCoerce formatFn) ∷ Number → String) (toNumber i)

formatDate ∷ D3Format → JSDate → Effect String
formatDate formatFn i =
  pure $ ((unsafeCoerce formatFn) ∷ JSDate → String) i
