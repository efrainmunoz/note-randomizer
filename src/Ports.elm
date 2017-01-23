port module Ports exposing (..)

import Model exposing (SavedSettings)


-- REQUEST PORTS


port requestSavedSettings : () -> Cmd msg


port requestSetRandomBgColor : Bool -> Cmd msg


port requestSetTimer : Bool -> Cmd msg


port requestSetTimerInterval : Float -> Cmd msg



-- RESPONSE PORTS


port responseSavedSettings : (SavedSettings -> msg) -> Sub msg
