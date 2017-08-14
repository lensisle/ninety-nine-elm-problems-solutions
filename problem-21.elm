module Main exposing (..)

import Html
import List
import Debug exposing (log)


insertAt : Int -> a -> List a -> List a
insertAt n v xs =
    log "list" (List.take (n - 1) xs ++ v :: [] ++ List.drop (n - 1) xs)


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ insertAt 2 99 [ 1, 2, 5, 5, 2, 1 ] == [ 1, 99, 2, 5, 5, 2, 1 ]
            , insertAt 3 99 (List.range 1 14) == [ 1, 2, 99, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ]
            , insertAt 6 99 (List.range 1 5) == [ 1, 2, 3, 4, 5, 99 ]
            , insertAt 0 99 (List.range 1 5) == [ 99, 1, 2, 3, 4, 5 ]
            , insertAt -1 99 (List.range 1 5) == [ 99, 1, 2, 3, 4, 5 ]
            , insertAt 1 99 (List.range 1 5) == [ 99, 1, 2, 3, 4, 5 ]
            , insertAt 2 "x" [ "1", "2", "3", "4", "5" ] == [ "1", "x", "2", "3", "4", "5" ]
            ]
