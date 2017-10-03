module RepoSearch.App exposing (app)

import Html exposing (..)
import Html.Attributes exposing (..)
import RepoSearch.Config exposing (..)
import RepoSearch.Types exposing (..)
import RepoSearch.State exposing (..)
import RepoSearch.Rest exposing (..)


app : Config -> Program Never Model Msg
app config =
    Html.program
        { init = init config
        , update = update config
        , subscriptions = subscriptions config
        , view = view config
        }


subscriptions : Config -> Model -> Sub Msg
subscriptions config model =
    Sub.none


view : Config -> Model -> Html Msg
view config model =
    div []
        [ config.searchInputView
        , section [ id "results" ]
            [ h1 [] [ text "Results" ]
            , div [] <| List.map config.searchResultView model.results
            ]
        , config.modalView model.modals
        ]
