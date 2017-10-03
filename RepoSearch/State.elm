module RepoSearch.State exposing (..)

import RepoSearch.Config exposing (..)
import RepoSearch.Types exposing (..)
import RepoSearch.Rest exposing (..)


update : Config -> Msg -> Model -> ( Model, Cmd Msg )
update config msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UpdateSearch newInput ->
            ( { model | searchInput = newInput }, Cmd.none )

        PerformSearch ->
            ( model
                |> popModalWithAction PerformSearch
            , repoSearch config model.searchInput
            )

        NewResults (Ok results) ->
            ( { model | results = results }, Cmd.none )

        NewResults (Err err) ->
            ( { model | errors = err :: model.errors }, Cmd.none )

        PushModal content ->
            ( { model | modals = content :: model.modals }, Cmd.none )

        PopModal ->
            let
                newList =
                    Maybe.withDefault [] <| List.tail model.modals
            in
                ( { model | modals = newList }, Cmd.none )


popModalWithAction : Msg -> Model -> Model
popModalWithAction msg model =
    case List.head model.modals of
        Nothing ->
            model

        Just openModal ->
            let
                ( label, action ) =
                    openModal.action

                newModals =
                    if action == msg then
                        Maybe.withDefault [] <| List.tail model.modals
                    else
                        model.modals
            in
                { model
                    | modals = newModals
                }


init : Config -> ( Model, Cmd Msg )
init config =
    ( { results = []
      , searchInput = ""
      , errors = []
      , modals = []
      }
    , Cmd.none
    )
