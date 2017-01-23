module App exposing (..)

import Commands exposing (randomNoteCmd, randomBgColorCmd)
import Html exposing (Html)
import Messages exposing (Msg(..))
import Model exposing (Model, defaultNote)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (view)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- INIT


init : ( Model, Cmd Msg )
init =
    ( { note = defaultNote
      , bgColor = "#ee7b06"
      , randomBgColorOn = True
      , settingsOpen = False
      }
    , randomNoteCmd
    )
