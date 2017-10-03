module RepoSearch.Config exposing (Config, config)

import RepoSearch.SearchResult.Types exposing (SearchResult)
import RepoSearch.SearchResult.View exposing (renderSearchResult)
import RepoSearch.SearchResult.Decoder exposing (decodeSearchResults)
import RepoSearch.SearchInput.View exposing (renderSearchInput)
import RepoSearch.Types exposing (..)
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
