module Model exposing (..)

import Time exposing (Time)


type Name
    = C
    | D
    | E
    | F
    | G
    | A
    | B


type Accidental
    = Flat
    | Sharp
    | Natural


type alias Note =
    { name : Name
    , accidental : Accidental
    }


type alias SavedSettings =
    { randomBgColorOn : Bool
    , timerOn : Bool
    , timerInterval : Time
    }


type alias Model =
    { note : Note
    , bgColor : String
    , randomBgColorOn : Bool
    , timerOn : Bool
    , timerInterval : Time
    , settingsOpen : Bool
    }


defaultNote : Note
defaultNote =
    Note C Natural
