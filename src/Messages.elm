module Messages exposing (..)

import Model exposing (Note)
import Keyboard


type Msg
    = NewNote Note
    | RandomNote
    | NewBgColor String
    | BgColorOption
    | KeyMsg Keyboard.KeyCode
    | OpenSettings
    | CloseSettings
