module Tests exposing (..)

import Test exposing (..)
import Expect
import App exposing (..)


all : Test
all =
    describe "Random Note Test Suite"
        [ describe "accidentalSymbol"
            [ test "should return 'b' when 'Flat'" <|
                \() ->
                    let
                        result : String
                        result =
                            accidentalSymbol Flat
                    in
                        Expect.equal "b" result
            , test "should return '#' when 'Sharp'" <|
                \() ->
                    let
                        result : String
                        result =
                            accidentalSymbol Sharp
                    in
                        Expect.equal "#" result
            , test "should return '' when 'Natural'" <|
                \() ->
                    let
                        result : String
                        result =
                            accidentalSymbol Natural
                    in
                        Expect.equal "" result
            ]
        ]
