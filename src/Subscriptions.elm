module Subscriptions exposing (..)

import Messages exposing (Msg(..))
import Model exposing (Model)
import Keyboard
import Time exposing (Time, every)
import Ports


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.downs KeyMsg
        , timerSub model
        , responseSavedSettingsSub
        ]



-- TIMER


timerSub : Model -> Sub Msg
timerSub model =
    case model.timerOn of
        True ->
            every model.timerInterval Tick

        False ->
            Sub.none



-- PORTS


responseSavedSettingsSub : Sub Msg
responseSavedSettingsSub =
    Ports.responseSavedSettings ResponseSavedSettings
