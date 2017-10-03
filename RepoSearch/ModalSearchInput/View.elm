module RepoSearch.ModalSearchInput.View exposing (..)

import RepoSearch.Types exposing (Msg, Msg(..))
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit, onClick)


renderModalSearch : Html Msg
renderModalSearch =
    div [ class "search-modal-trigger" ]
        [ button
            [ type_ "button"
            , onClick <|
                PushModal
                    { title = "Search"
                    , content = renderModalSearchInput
                    , action = ( "Go", PerformSearch )
                    }
            ]
            [ text "Open Search Modal" ]
        ]


renderModalSearchInput : Html Msg
renderModalSearchInput =
    div [ class "search-input" ]
        [ input [ onInput UpdateSearch, placeholder "Enter search..." ] []
        ]
