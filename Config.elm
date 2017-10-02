module Config exposing (Config, config)

import SearchResult.Types exposing (SearchResult)
import SearchResult.View exposing (renderSearchResult)
import SearchResult.Decoder exposing (decodeSearchResults)
import SearchInput.View exposing (renderSearchInput)
import Types exposing (..)
import Json.Decode as Decode
import Html exposing (Html)


type alias Config =
    { searchResultView : SearchResult -> Html Msg
    , searchResultDecoder : Decode.Decoder (List SearchResult)
    , searchInputView : Html Msg
    }


config : Config
config =
    { searchResultView = renderSearchResult
    , searchResultDecoder = decodeSearchResults
    , searchInputView = renderSearchInput
    }
