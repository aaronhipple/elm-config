module SearchResult.View exposing (..)

import SearchResult.Types exposing (..)
import Types exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


renderSearchResult : SearchResult -> Html Msg
renderSearchResult result =
    article [ class "search-result", id <| toString result.id ]
        [ h4 []
            [ a [ href result.url ] [ text result.full_name ] ]
        , a [ href result.url ]
            [ img
                [ src result.owner.avatar_url
                , alt result.owner.login
                , style [ ( "max-width", "50px" ) ]
                ]
                []
            ]
        , p [] [ text <| Maybe.withDefault "Unknown Language" result.language ]
        , p [] [ text <| Maybe.withDefault "" result.description ]
        ]
