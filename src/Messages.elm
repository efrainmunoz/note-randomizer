module Messages exposing (..)

import Model exposing (Note)
import Keyboard
import Time exposing (Time)
import Model exposing (SavedSettings)


type Msg
    = NewNote Note
    | RandomNote
    | NewBgColor String
    | BgColorOption
    | KeyMsg Keyboard.KeyCode
    | OpenSettings
    | CloseSettings
    | Tick Time
    | TimerOption String
    | RequestSavedSettings
    | ResponseSavedSettings SavedSettings
