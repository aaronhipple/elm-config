module SearchResult.Types exposing (..)


type alias SearchResult =
    { id : Int
    , name : String
    , full_name : String
    , description : Maybe String
    , url : String
    , language : Maybe String
    , owner : SearchResultOwner
    }


type alias SearchResultOwner =
    { id : Int
    , login : String
    , avatar_url : String
    }
