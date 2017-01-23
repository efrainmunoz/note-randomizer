module View exposing (..)

import Html exposing (Html, div, hr, span, text, input, option, select)
import Html.Attributes exposing (class, style, type_, checked, value, selected)
import Html.Events exposing (onClick, onCheck)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Utilities exposing (accidentalSymbol, onChange, selectedTimer)


view : Model -> Html Msg
view model =
    div [ class "flex-column", style [ ( "backgroundColor", model.bgColor ) ] ]
        [ nav
        , mainArea model
        , footer
        , settingsModal model
        ]



-- NAV


nav : Html Msg
nav =
    div [ class "nav flex-row" ]
        [ logo
        , settingsIcon
        ]


logo : Html Msg
logo =
    div [ class "logo" ] [ text "NOTE RANDOMIZER" ]


settingsIcon : Html Msg
settingsIcon =
    div [ class "settings-icon", onClick OpenSettings ]
        [ span [ class "fa fa-cog" ] [] ]



-- MAIN AREA


mainArea : Model -> Html Msg
mainArea model =
    div [ class "note-box", onClick RandomNote ]
        [ div [ class "note" ]
            [ span [ class "note-name" ]
                [ text (toString model.note.name) ]
            , span [ class "accidental" ]
                [ text (accidentalSymbol model.note.accidental) ]
            ]
        ]



-- FOOTER


footer : Html Msg
footer =
    div [ class "footer flex-row" ] [ instructions ]


instructions : Html Msg
instructions =
    div [ class "instructions" ] [ text "Tap the Spacebar" ]



-- SETTINGS


settingsModal : Model -> Html Msg
settingsModal model =
    if model.settingsOpen then
        div [ class "settings-modal" ]
            [ settingsHeader
            , hr [ class "settings-hr" ] []
            , settingsBgColor model.randomBgColorOn
            , settingsTimer model
            ]
    else
        div [] []


settingsHeader : Html Msg
settingsHeader =
    div [ class "settings-header" ]
        [ div [ class "settings-title" ] [ text "SETTINGS" ]
        , settingsCloseIcon
        ]


settingsCloseIcon : Html Msg
settingsCloseIcon =
    div [ class "settings-close-icon", onClick CloseSettings ]
        [ span [ class "fa fa-times" ] []
        ]


settingsBgColor : Bool -> Html Msg
settingsBgColor option =
    div [ class "settings-bgcolor" ]
        [ text "Random Color:"
        , case option of
            True ->
                span [ class "fa fa-check-square-o", onClick BgColorOption ] []

            False ->
                span [ class "fa fa-square-o", onClick BgColorOption ] []
        ]


settingsTimer : Model -> Html Msg
settingsTimer model =
    div [ class "settings-timer" ]
        [ text "Timer:"
        , select [ onChange TimerOption ]
            [ option [ value "OFF", selected (selectedTimer "OFF" model) ]
                [ text "OFF" ]
            , option [ value "1000", selected (selectedTimer "1000" model) ]
                [ text "1 Second" ]
            , option [ value "2000", selected (selectedTimer "2000" model) ]
                [ text "2 Seconds" ]
            , option [ value "4000", selected (selectedTimer "4000" model) ]
                [ text "4 Seconds" ]
            , option [ value "8000", selected (selectedTimer "8000" model) ]
                [ text "8 Seconds" ]
            , option [ value "16000", selected (selectedTimer "16000" model) ]
                [ text "16 Seconds" ]
            , option [ value "32000", selected (selectedTimer "32000" model) ]
                [ text "32 Seconds" ]
            , option [ value "64000", selected (selectedTimer "64000" model) ]
                [ text "64 Seconds" ]
            ]
        ]
