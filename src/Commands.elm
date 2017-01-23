module Commands exposing (randomNoteCmd, randomBgColorCmd)

import Messages exposing (Msg(..))
import Random
import Utilities exposing (note, bgColor)


randomNoteCmd : Cmd Msg
randomNoteCmd =
    Random.generate NewNote note


randomBgColorCmd : Bool -> Cmd Msg
randomBgColorCmd randomBgColorOn =
    case randomBgColorOn of
        True ->
            Random.generate NewBgColor bgColor

        False ->
            Cmd.none
