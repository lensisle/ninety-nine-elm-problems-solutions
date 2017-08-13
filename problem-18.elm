module Main exposing (..)

import Array
import Html
import List


sublist : Int -> Int -> List a -> List a
sublist start end list =
    let
        startNorm =
            Basics.max 0 (start - 1)

        endNorm =
            Basics.max 0 end

        result =
            list |> Array.fromList |> Array.slice startNorm endNorm |> Array.toList
    in
        result


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
            [ True
            , sublist 3 7 (List.range 1 10) == List.range 3 7
            , sublist 2 100 [ 'a', 'b', 'c' ] == [ 'b', 'c' ]
            , sublist -1 2 (List.range 1 100) == [ 1, 2 ]
            , sublist -3 -2 [ -3, -2, -1, 0, 1, 2, 3 ] == []
            , sublist 5 3 [ "indices", " are", "inverted" ] == []
            , sublist 0 1 (List.range 1 10) == [ 1 ]
            , sublist -7 -3 (List.range 1 10) == []
            ]
