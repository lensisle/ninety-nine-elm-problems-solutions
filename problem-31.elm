module Main exposing (..)

import Html
import List


erastos : Int -> List Int -> Bool
erastos n xs =
    case xs of
        [] ->
            True

        y :: ys ->
            if n % y == 0 then
                False
            else
                let
                    filtered =
                        List.filter (\val -> val % y /= 0) ys
                in
                    erastos n filtered


isPrime : Int -> Bool
isPrime n =
    if n < 2 then
        False
    else
        let
            range =
                List.range 2 (n // 2)
        in
            erastos n range



{--
isPrime : Int -> Bool
isPrime n =
    if n < 2 then
        False
    else
        let
            range =
                List.range 2 (n // 2)

            filtered =
                log "filtered" (List.filter (\val -> n % val == 0) range)
        in
            log "Is Prime" ((List.length filtered) == 0)
--}


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
