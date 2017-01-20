module Commands exposing (randomNoteCmd, randomBgColorCmd)

import Messages exposing (Msg(..))
import Random
import Utilities exposing (note, bgColor)


randomNoteCmd : Cmd Msg
randomNoteCmd =
    Random.generate NewNote note


randomBgColorCmd : Cmd Msg
randomBgColorCmd =
    Random.generate NewBgColor bgColor
