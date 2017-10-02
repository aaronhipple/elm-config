module SearchResult.DecoderTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, list, int, string, maybe)
import Test exposing (..)
import SearchResult.Types exposing (..)
import SearchResult.Decoder exposing (..)
import Json.Decode exposing (decodeValue)
import Json.Encode as Json


suite : Test
suite =
    describe "the default SearchResult decoder"
        [ fuzz3 int string string "decodeSearchResultOwner maps to a SearchResultOwner" <|
            \id login avatar_url ->
                let
                    owner =
                        Json.object
                            [ ( "id", Json.int id )
                            , ( "login", Json.string login )
                            , ( "avatar_url", Json.string avatar_url )
                            ]
                in
                    decodeValue decodeSearchResultOwner owner
                        |> Expect.equal
                            (Ok
                                { id = id
                                , login = login
                                , avatar_url = avatar_url
                                }
                            )
        , fuzz5 int string (maybe string) string (maybe string) "decodeSearchResult maps to a SearchResult" <|
            \id name description url language ->
                let
                    owner =
                        { id = 1
                        , login = "login"
                        , avatar_url = "avatar_url"
                        }

                    full_name =
                        owner.login ++ "/" ++ name

                    ownerJson =
                        Json.object
                            [ ( "id", Json.int owner.id )
                            , ( "login", Json.string owner.login )
                            , ( "avatar_url", Json.string owner.avatar_url )
                            ]

                    resultJson =
                        Json.object
                            [ ( "id", Json.int id )
                            , ( "name", Json.string name )
                            , ( "full_name", Json.string full_name )
                            , ( "description", maybeString description )
                            , ( "url", Json.string url )
                            , ( "language", maybeString language )
                            , ( "owner", ownerJson )
                            ]
                in
                    decodeValue decodeSearchResult resultJson
                        |> Expect.equal
                            (Ok
                                { id = id
                                , name = name
                                , full_name = full_name
                                , description = description
                                , url = url
                                , language = language
                                , owner = owner
                                }
                            )
        ]


maybeString : Maybe String -> Json.Value
maybeString something =
    case something of
        Just str ->
            Json.string str

        Nothing ->
            Json.null
