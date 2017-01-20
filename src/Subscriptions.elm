module Subscriptions exposing (..)

import Messages exposing (Msg(..))
import Model exposing (Model)
import Keyboard


subscriptions : Model -> Sub Msg
subscriptions model =
    Keyboard.downs KeyMsg
