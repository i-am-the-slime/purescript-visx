module VISX.Tooltip where

import Prelude
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import React.Basic.Hooks (Hook, unsafeHook)
import Record.Extra (sequenceRecord)
import Untagged.Union (UndefinedOr, uorToMaybe)

foreign import data UseTooltip ∷ Type → Type → Type

foreign import data TooltipPosition ∷ Type

type TooltipData
  = {}

type UseTooltipValuesImpl a
  = { hideTooltip ∷ UndefinedOr (Effect Unit)
    , showTooltip ∷ UndefinedOr (EffectFn1 TooltipPosition Unit)
    , tooltipData ∷ UndefinedOr a
    , tooltipLeft ∷ UndefinedOr Number
    , tooltipOpen ∷ UndefinedOr Boolean
    , tooltipTop ∷ UndefinedOr Number
    , updateTooltip ∷ UndefinedOr (EffectFn1 TooltipPosition Unit)
    }

type UseTooltipValues a
  = { hideTooltip ∷ Effect Unit
    , showTooltip ∷ TooltipPosition → Effect Unit
    , tooltipData ∷ a
    , tooltipLeft ∷ Number
    , tooltipOpen ∷ Boolean
    , tooltipTop ∷ Number
    , updateTooltip ∷ TooltipPosition → Effect Unit
    }

foreign import useTooltipImpl ∷ ∀ a. Effect (UseTooltipValuesImpl a)

useTooltip ∷ ∀ a. Hook (UseTooltip a) (Maybe (UseTooltipValues a))
useTooltip =
  unsafeHook useTooltipImpl
    <#> \baseProps →
        sequenceRecord
          $
            { hideTooltip: uorToMaybe baseProps.hideTooltip
            , showTooltip: uorToMaybe baseProps.showTooltip <#> runEffectFn1
            , tooltipData: uorToMaybe baseProps.tooltipData
            , tooltipLeft: uorToMaybe baseProps.tooltipLeft
            , tooltipOpen: uorToMaybe baseProps.tooltipOpen
            , tooltipTop: uorToMaybe baseProps.tooltipTop
            , updateTooltip: uorToMaybe baseProps.updateTooltip <#> runEffectFn1
            }
