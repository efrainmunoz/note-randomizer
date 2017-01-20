module Model exposing (..)


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


type alias Model =
    { note : Note
    , bgColor : String
    }


defaultNote : Note
defaultNote =
    Note C Natural
