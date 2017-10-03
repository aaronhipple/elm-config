module RepoSearch.Modal.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onSubmit, onWithOptions)
import RepoSearch.Types exposing (Msg, Msg(..), Modal)
import Json.Decode


renderModal : List Modal -> Html Msg
renderModal modals =
    case List.head modals of
        Nothing ->
            div [] []

        Just modal ->
            let
                ( goLabel, goAction ) =
                    modal.action

                stopClicks =
                    onWithOptions
                        "click"
                        { stopPropagation = True, preventDefault = False }
                        (Json.Decode.succeed NoOp)

                modalHeader =
                    div [ class "modal-header" ] [ h4 [] [ text modal.title ] ]

                content =
                    div [ class "modal-content" ] [ modal.content ]

                actions =
                    div [ class "modal-actions" ]
                        [ button [ type_ "button", onClick PopModal ] [ text "Close" ]
                        , button [ type_ "submit" ] [ text goLabel ]
                        ]
            in
                Html.form [ class "modal", onSubmit goAction, onClick PopModal ]
                    [ div [ class "modal-dialog", stopClicks ]
                        [ modalHeader
                        , content
                        , actions
                        ]
                    ]
