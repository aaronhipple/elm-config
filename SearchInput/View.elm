module SearchInput.View exposing (..)

import Types exposing (Msg, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)


renderSearchInput : Html Msg
renderSearchInput =
    Html.form [ class "search-input", onSubmit PerformSearch ]
        [ input [ onInput UpdateSearch, placeholder "Enter search..." ] []
        , button [ type_ "submit" ] [ text "Go" ]
        ]
