module VISX.Tooltip where

import Prelude
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Uncurried (EffectFn1, runEffectFn1)
import Foreign (Foreign)
import React.Basic.Hooks (Hook, ReactComponent, unsafeHook)
import Record.Extra (sequenceRecord)
import Untagged.Union (UndefinedOr, uorToMaybe)

foreign import data UseTooltip ∷ Type → Type → Type

foreign import data TooltipPosition ∷ Type

type TooltipData
  = {}

type UseTooltipValuesImpl a
  = { hideTooltip ∷ Effect Unit
    , showTooltip ∷ EffectFn1 TooltipPosition Unit
    , tooltipData ∷ UndefinedOr a
    , tooltipLeft ∷ UndefinedOr Number
    , tooltipOpen ∷ Boolean
    , tooltipTop ∷ UndefinedOr Number
    , updateTooltip ∷ EffectFn1 TooltipPosition Unit
    }

type UseTooltipValues a
  = { hideTooltip ∷ Effect Unit
    , showTooltip ∷ TooltipPosition → Effect Unit
    , tooltipData ∷ Maybe a
    , tooltipLeft ∷ Maybe Number
    , tooltipOpen ∷ Boolean
    , tooltipTop ∷ Maybe Number
    , updateTooltip ∷ TooltipPosition → Effect Unit
    }

foreign import useTooltipImpl ∷ ∀ a. Effect (UseTooltipValuesImpl a)
foreign import useTooltipInPortalImpl ∷ ∀ a. Effect (UseTooltipValuesImpl a)

useTooltip ∷ ∀ a. Hook (UseTooltip a) (UseTooltipValues a)
useTooltip =
  unsafeHook useTooltipImpl
    <#> \baseProps →
        { hideTooltip: baseProps.hideTooltip
        , showTooltip: baseProps.showTooltip # runEffectFn1
        , tooltipData: uorToMaybe baseProps.tooltipData
        , tooltipLeft: uorToMaybe baseProps.tooltipLeft
        , tooltipOpen: baseProps.tooltipOpen
        , tooltipTop: uorToMaybe baseProps.tooltipTop
        , updateTooltip: baseProps.updateTooltip # runEffectFn1
        }

-- useTooltipInPortal ∷ ∀ a. Hook (UseTooltip a) (Maybe (UseTooltipValues a))
-- useTooltipInPortal =
--   unsafeHook useTooltipInPortalImpl
--     <#> \baseProps →
--         sequenceRecord
--           $
--             { hideTooltip: uorToMaybe baseProps.hideTooltip
--             , showTooltip: uorToMaybe baseProps.showTooltip <#> runEffectFn1
--             , tooltipData: uorToMaybe baseProps.tooltipData
--             , tooltipLeft: uorToMaybe baseProps.tooltipLeft
--             , tooltipOpen: uorToMaybe baseProps.tooltipOpen
--             , tooltipTop: uorToMaybe baseProps.tooltipTop
--             , updateTooltip: uorToMaybe baseProps.updateTooltip <#> runEffectFn1
--             }
foreign import tooltipImpl ∷ ∀ p. ReactComponent p
foreign import defaultStylesImpl ∷ Foreign
foreign import tooltipWithBoundsImpl ∷ ∀ p. ReactComponent p
foreign import portalImpl ∷ ∀ p. ReactComponent p
