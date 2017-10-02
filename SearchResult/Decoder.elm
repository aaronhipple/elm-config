module SearchResult.Decoder exposing (..)

import Json.Decode exposing (..)
import SearchResult.Types exposing (..)


decodeSearchResults : Decoder (List SearchResult)
decodeSearchResults =
    at [ "items" ] <| list decodeSearchResult


decodeSearchResult : Decoder SearchResult
decodeSearchResult =
    map7 SearchResult
        (field "id" int)
        (field "name" string)
        (field "full_name" string)
        (field "description" (maybe string))
        (field "url" string)
        (field "language" (maybe string))
        (field "owner" decodeSearchResultOwner)


decodeSearchResultOwner : Decoder SearchResultOwner
decodeSearchResultOwner =
    map3 SearchResultOwner
        (field "id" int)
        (field "login" string)
        (field "avatar_url" string)
