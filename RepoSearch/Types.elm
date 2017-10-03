module RepoSearch.Types exposing (..)

import RepoSearch.SearchResult.Types exposing (..)
import Http
import Html exposing (Html)


type alias Model =
    { results : List SearchResult
    , searchInput : String
    , errors : List Http.Error
    , modals : List Modal
    }


type alias Modal =
    { title : String
    , content : Html Msg
    , action : ( String, Msg )
    }


type Msg
    = NoOp
    | UpdateSearch String
    | PerformSearch
    | NewResults (Result Http.Error (List SearchResult))
    | PushModal Modal
    | PopModal
