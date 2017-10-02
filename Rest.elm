module Rest exposing (repoSearch)

import Types exposing (Msg, Msg(..))
import Config exposing (Config)
import Http


repoSearch : Config -> String -> Cmd Msg
repoSearch config searchInput =
    let
        url =
            "https://api.github.com/search/repositories?q=" ++ searchInput
    in
        Http.send NewResults (Http.get url config.searchResultDecoder)
