module RepoSearch.SearchResult.View exposing (..)

import RepoSearch.SearchResult.Types exposing (..)
import RepoSearch.Types exposing (Msg)
import Html exposing (..)
import Html.Attributes exposing (..)


renderSearchResult : SearchResult -> Html Msg
renderSearchResult result =
    article [ class "search-result", id <| toString result.id ]
        [ a [ href result.url, class "avatar" ]
            [ img
                [ src result.owner.avatar_url
                , alt result.owner.login
                , style [ ( "max-width", "50px" ) ]
                ]
                []
            ]
        , h4 []
            [ a [ href result.url ] [ text result.full_name ] ]
        , p [] [ text <| Maybe.withDefault "Unknown Language" result.language ]
        , p [] [ text <| Maybe.withDefault "" result.description ]
        ]
