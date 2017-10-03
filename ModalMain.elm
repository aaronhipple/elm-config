module ModalMain exposing (..)

import RepoSearch.Config exposing (..)
import RepoSearch.App exposing (app)
import RepoSearch.ModalSearchInput.View exposing (renderModalSearch)


customConfig =
    { config
        | searchInputView = renderModalSearch
    }


main =
    app customConfig
