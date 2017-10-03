module RepoSearch.Rest exposing (repoSearch)

import RepoSearch.Types exposing (Msg, Msg(..))
import RepoSearch.Config exposing (Config)
import Http


repoSearch : Config -> String -> Cmd Msg
repoSearch config searchInput =
    let
        url =
            "https://api.github.com/search/repositories?q=" ++ searchInput
    in
        Http.send NewResults (Http.get url config.searchResultDecoder)
