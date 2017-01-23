module Update exposing (..)

import Commands exposing (randomNoteCmd, randomBgColorCmd)
import Messages exposing (Msg(..))
import Model exposing (Model, Note)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewNote newNote ->
            newNoteMsg newNote model

        NewBgColor newBgColor ->
            newBgColorMsg newBgColor model

        BgColorOption ->
            ( { model | randomBgColorOn = not model.randomBgColorOn }, Cmd.none )

        RandomNote ->
            ( model, randomNoteCmd )

        KeyMsg code ->
            case code of
                32 ->
                    ( model, randomNoteCmd )

                _ ->
                    ( model, Cmd.none )

        OpenSettings ->
            ( { model | settingsOpen = True }
            , Cmd.none
            )

        CloseSettings ->
            ( { model | settingsOpen = False }, Cmd.none )



-- NewNote Message


newNoteMsg : Note -> Model -> ( Model, Cmd Msg )
newNoteMsg newNote model =
    if newNote == model.note then
        ( model, randomNoteCmd )
    else
        ( { model | note = newNote }
        , randomBgColorCmd model.randomBgColorOn
        )



-- NewBgColor Message


newBgColorMsg : String -> Model -> ( Model, Cmd Msg )
newBgColorMsg newBgColor model =
    case model.randomBgColorOn of
        True ->
            if newBgColor == model.bgColor then
                ( model, randomBgColorCmd True )
            else
                ( { model | bgColor = newBgColor }
                , Cmd.none
                )

        False ->
            ( model, Cmd.none )
