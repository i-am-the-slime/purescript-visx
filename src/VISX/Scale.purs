module VISX.Scale (scaleBand, BandScale, LinearScale, scaleLinear,
  scaled, class Scale, bandwidth) where

import Data.Function (flip)
import Data.Maybe (Maybe)
import Data.Tuple.Nested (type (/\))
import Effect (Effect)
import Foreign (Foreign)
import VISX.FFI (class Options, class WriteForeign, toOptions)
import VISX.FFI as FFI

class Scale :: forall k. k -> Constraint
class Scale scale

foreign import scaleValueImpl :: forall scale domain range. scale -> domain -> Effect range

scaled ∷ ∀ scale domain range. Scale (scale domain range) => domain -> scale domain range -> Effect range
scaled = flip scaleValueImpl

-- Linear Scale
foreign import data LinearScale ∷ Type -> Type -> Type
instance Scale (LinearScale a b)

type LinearScaleConfig =
  { domain ∷ Number /\ Number
  , range ∷ Number /\ Number
  , round ∷ Maybe Boolean
  , nice ∷ Maybe Boolean
  , clamp ∷ Maybe Boolean
  }

foreign import scaleLinearImpl ∷ ∀ a. Foreign -> LinearScale Number a


scaleLinear ∷
  ∀ opt.
  Options opt LinearScaleConfig =>
  opt -> LinearScale Number _
scaleLinear config =
  scaleLinearImpl
    (FFI.write (toOptions config ∷ LinearScaleConfig))

-- 
foreign import data BandScale ∷ Type -> Type -> Type
instance Scale (BandScale a b)

type BandScaleConfig a =
  { domain ∷ Array a
  , range ∷ Number /\ Number
  , round ∷ Maybe Boolean
  , padding ∷ Maybe Number
  }

foreign import scaleBandImpl ∷ ∀ a b. Foreign -> (BandScale a b)

scaleBand ∷
  ∀ opt a b.
  Options opt (BandScaleConfig a) =>
  WriteForeign a =>
  opt -> BandScale a b
scaleBand config =
  scaleBandImpl
    (FFI.write (toOptions config ∷ (BandScaleConfig a)))

foreign import bandwidth ∷ ∀ a b. BandScale a b -> Effect b
