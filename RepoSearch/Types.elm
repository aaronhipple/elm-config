module RepoSearch.Types exposing (..)

import RepoSearch.SearchResult.Types exposing (..)
import Http


type alias Model =
    { results : List SearchResult
    , searchInput : String
    , errors : List Http.Error
    }


type Msg
    = UpdateSearch String
    | PerformSearch
    | NewResults (Result Http.Error (List SearchResult))
