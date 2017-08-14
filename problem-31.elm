module Main exposing (..)

import Html
import List
import Debug exposing (log)


getSieveOfEratosthenes : List Int -> List Int
getSieveOfEratosthenes xs =
    if List.length xs < 1 then
        []
    else
        case xs of
            y :: ys ->
                let
                    filtered =
                        List.filter (\val -> val % y == 0) ys
                in
                    log "list" filtered ++ getSieveOfEratosthenes ys

            _ ->
                []


isPrime : Int -> Bool
isPrime n =
    let
        range =
            List.range 2 n

        sieve =
            getSieveOfEratosthenes range
    in
        0 < (List.length <| List.filter (\val -> val == n) <| sieve)


main =
    Html.text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( isPrime 36, False )
        , ( isPrime 10, False )
        , ( isPrime -1, False )
        , ( isPrime 1, False )
        , ( isPrime 0, False )
        , ( isPrime 120, False )
        , ( isPrime 2, True )
        , ( isPrime 23, True )
        , ( isPrime 6000, False )
        , ( isPrime 7919, True )
        , ( isPrime 7911, False )
        , ( isPrime 63247, True )
        , ( isPrime 63249, False )
        ]
