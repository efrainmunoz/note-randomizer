module Utilities exposing (accidentalSymbol, note, bgColor)

import Array exposing (Array)
import Model exposing (Accidental(..), Name(..), Note)
import Random


-- NOTES


accidentalSymbol : Accidental -> String
accidentalSymbol accidental =
    case accidental of
        Flat ->
            "b"

        Sharp ->
            "#"

        Natural ->
            ""


note : Random.Generator Note
note =
    Random.map2 Note name accidental


accidental : Random.Generator Accidental
accidental =
    Random.map accidentalMapping (Random.int 1 3)


accidentalMapping : Int -> Accidental
accidentalMapping int =
    case int of
        1 ->
            Flat

        2 ->
            Sharp

        _ ->
            Natural


name : Random.Generator Name
name =
    Random.map nameMapping (Random.int 1 7)


nameMapping : Int -> Name
nameMapping int =
    case int of
        1 ->
            C

        2 ->
            D

        3 ->
            E

        4 ->
            F

        5 ->
            G

        6 ->
            A

        _ ->
            B



-- COLORS


bgColors : Array String
bgColors =
    Array.fromList
        [ "#1d9dbd"
        , "#3fc380"
        , "#a0b0a8"
        , "#d24d57"
        , "#ee7b06"
        , "#e0758c"
        , "#464545"
        ]


bgColor : Random.Generator String
bgColor =
    Random.map getBgColor (Random.int 0 6)


getBgColor : Int -> String
getBgColor int =
    let
        color =
            Array.get int bgColors
    in
        case color of
            Just randomColor ->
                randomColor

            Nothing ->
                "#1d9dbd"
