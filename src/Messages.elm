module Messages exposing (..)

import Model exposing (Note)
import Keyboard


type Msg
    = NewNote Note
    | RandomNote
    | NewBgColor String
    | KeyMsg Keyboard.KeyCode
