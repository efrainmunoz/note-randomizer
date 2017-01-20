module View exposing (..)

import Html exposing (Html, div, span, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Model exposing (Model)
import Utilities exposing (accidentalSymbol)


view : Model -> Html Msg
view model =
    div [ class "flex-column", style [ ( "backgroundColor", model.bgColor ) ] ]
        [ nav
        , mainArea model
        , footer
        ]



-- NAV


nav : Html Msg
nav =
    div [ class "nav flex-row" ]
        [ logo
        , settings
        ]


logo : Html Msg
logo =
    div [ class "logo" ] [ text "NOTE RANDOMIZER" ]


settings : Html Msg
settings =
    div [ class "settings" ]
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
