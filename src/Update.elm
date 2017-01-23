module Update exposing (..)

import Commands exposing (randomNoteCmd, randomBgColorCmd)
import Messages exposing (Msg(..))
import Model exposing (Model, Note)
import Ports


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NewNote newNote ->
            newNoteMsg newNote model

        NewBgColor newBgColor ->
            newBgColorMsg newBgColor model

        BgColorOption ->
            ( { model | randomBgColorOn = not model.randomBgColorOn }
            , Ports.requestSetRandomBgColor (not model.randomBgColorOn)
            )

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

        Tick time ->
            ( model, randomNoteCmd )

        TimerOption option ->
            case String.toFloat option of
                Ok interval ->
                    ( { model | timerOn = True, timerInterval = interval }
                    , Cmd.batch
                        [ Ports.requestSetTimer True
                        , Ports.requestSetTimerInterval interval
                        ]
                    )

                Err off ->
                    ( { model | timerOn = False }, Ports.requestSetTimer False )

        RequestSavedSettings ->
            ( model, Ports.requestSavedSettings () )

        ResponseSavedSettings savedSettings ->
            ( { model
                | randomBgColorOn = savedSettings.randomBgColorOn
                , timerOn = savedSettings.timerOn
                , timerInterval = savedSettings.timerInterval
              }
            , Cmd.none
            )



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
