module View exposing (..)

import Html exposing (Html, div, hr, span, text, input)
import Html.Attributes exposing (class, style, type_, checked)
import Html.Events exposing (onClick, onCheck)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Utilities exposing (accidentalSymbol)


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
