module Main exposing (..)

import Html
import List


sieve : Int -> List Int -> Bool
sieve n xs =
    case xs of
        [] ->
            True

        y :: ys ->
            if n % y == 0 then
                False
            else
                sieve n (List.filter (\val -> val % y /= 0) ys)


isPrime : Int -> Bool
isPrime n =
    if n < 2 then
        False
    else
        sieve n (List.range 2 (n // 2))


totient : Int -> Int
totient n =
    if n < 1 then
        0
    else
        List.range 0 n
            |> List.filter (\val -> isPrime val)
            |> List.length


main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            n ->
                "Your implementation failed " ++ (toString n) ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ totient 10 == 4
            , totient 25 == 20
            , totient 120 == 32
            , totient 0 == 0
            , totient 1600 == 640
            , totient 37 == 36
            , totient 330 == 80
            , totient 65934 == 19440
            , totient 1313 == 1200
            , totient 45 == 24
            , totient -23 == 0
            ]
