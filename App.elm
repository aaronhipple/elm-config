module App exposing (app)

import Html exposing (..)
import Html.Attributes exposing (..)
import Config exposing (..)
import Types exposing (..)
import Rest exposing (..)


app : Config -> Program Never Model Msg
app config =
    Html.program
        { init = init config
        , update = update config
        , subscriptions = subscriptions config
        , view = view config
        }


init : Config -> ( Model, Cmd Msg )
init config =
    ( { results = []
      , searchInput = ""
      , errors = []
      }
    , Cmd.none
    )


update : Config -> Msg -> Model -> ( Model, Cmd Msg )
update config msg model =
    case msg of
        UpdateSearch newInput ->
            ( { model | searchInput = newInput }, Cmd.none )

        PerformSearch ->
            ( model, repoSearch config model.searchInput )

        NewResults (Ok results) ->
            ( { model | results = results }, Cmd.none )

        NewResults (Err err) ->
            ( { model | errors = err :: model.errors }, Cmd.none )


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
        ]
