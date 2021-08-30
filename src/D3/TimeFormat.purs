module D3.TimeFormat where

import D3.Format (D3Format)
import Unsafe.Coerce (unsafeCoerce)

foreign import data D3TimeFormat ∷ Type

foreign import timeFormat ∷ String → D3TimeFormat

newtype D3TimeFormatLocale
  = D3TimeFormatLocale
  { dateTime ∷ String
  , date ∷ String
  , time ∷ String
  , periods ∷ Array String
  , days ∷ Array String
  , shortDays ∷ Array String
  , months ∷ Array String
  , shortMonths ∷ Array String
  }

foreign import localeTimeFormat ∷ D3TimeFormatLocale → String → D3TimeFormat

toD3Format ∷ D3TimeFormat → D3Format
toD3Format = unsafeCoerce
