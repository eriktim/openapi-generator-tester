{-
   Swagger Petstore
   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   OpenAPI spec version: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Data.Cat exposing (Cat, HuntingSkill(..), catDecoder, catEncoder)

import DateOnly exposing (DateOnly, dateOnlyDecoder, dateOnlyEncoder)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (optional, required)
import Json.Encode as Encode
import Maybe exposing (map, withDefault)


type alias Cat =
    { type_ : String
    , id : Int
    , name : String
    , dateOfBirth : Maybe DateOnly
    , huntingSkill : HuntingSkill
    }


type HuntingSkill
    = Clueless
    | Lazy
    | Adventurous
    | Aggressive



catDecoder : Decoder Cat
catDecoder =
    Decode.succeed Cat
        |> required "id" Decode.int
        |> required "name" Decode.string
        |> optional "dateOfBirth" (Decode.nullable dateOnlyDecoder) Nothing
        |> required "huntingSkill" huntingSkillDecoder



catEncoder : Cat -> Encode.Value
catEncoder model =
    Encode.object
        [ ( "type", Encode.string "Cat" )
        , ( "id", Encode.int model.id )
        , ( "name", Encode.string model.name )
        , ( "dateOfBirth", withDefault Encode.null (map dateOnlyEncoder model.dateOfBirth) )
        , ( "huntingSkill", huntingSkillEncoder model.huntingSkill )
        ]


huntingSkillDecoder : Decoder HuntingSkill
huntingSkillDecoder =
    Decode.string
        |> Decode.andThen (\str ->
            case str of
                "clueless" ->
                    Decode.succeed Clueless

                "lazy" ->
                    Decode.succeed Lazy

                "adventurous" ->
                    Decode.succeed Adventurous

                "aggressive" ->
                    Decode.succeed Aggressive

                other ->
                    Decode.fail <| "Unknown type: " ++ other
        )


huntingSkillEncoder : HuntingSkill -> Encode.Value
huntingSkillEncoder model =
    case model of
        Clueless ->
            Encode.string "clueless"

        Lazy ->
            Encode.string "lazy"

        Adventurous ->
            Encode.string "adventurous"

        Aggressive ->
            Encode.string "aggressive"



