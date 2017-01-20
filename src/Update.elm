module Update exposing (..)

import Commands exposing (randomNoteCmd, randomBgColorCmd)
import Messages exposing (Msg(..))
import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewNote newNote ->
            if newNote == model.note then
                ( model, randomNoteCmd )
            else
                ( { model | note = newNote }
                , Cmd.none
                )

        NewBgColor newBgColor ->
            if newBgColor == model.bgColor then
                ( model, randomBgColorCmd )
            else
                ( { model | bgColor = newBgColor }
                , Cmd.none
                )

        RandomNote ->
            ( model, Cmd.batch [ randomNoteCmd, randomBgColorCmd ] )

        KeyMsg code ->
            case code of
                32 ->
                    ( model, Cmd.batch [ randomNoteCmd, randomBgColorCmd ] )

                _ ->
                    ( model, Cmd.none )
