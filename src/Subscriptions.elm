module Subscriptions exposing (..)

import Messages exposing (Msg(..))
import Model exposing (Model)
import Keyboard
import Time exposing (Time, every)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.downs KeyMsg
        , timerSub model
        ]



-- TIMER


timerSub : Model -> Sub Msg
timerSub model =
    case model.timerOn of
        True ->
            every model.timerInterval Tick

        False ->
            Sub.none
