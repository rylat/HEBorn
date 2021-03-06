module Utils.Json.Decode exposing (date, exclusively)

import Date exposing (Date)
import Json.Decode exposing (Decoder, succeed, fail, andThen, string)


date : Decoder Date
date =
    string |> andThen decodeDate


exclusively : a -> Decoder a -> Decoder a
exclusively val =
    andThen (decodeExclusively val)



-- internals


decodeDate : String -> Decoder Date
decodeDate str =
    case Date.fromString str of
        Ok date ->
            succeed date

        Err err ->
            fail err


decodeExclusively : a -> a -> Decoder a
decodeExclusively wanting received =
    if wanting == received then
        succeed wanting
    else
        fail <|
            "A field is requiring a value '"
                ++ toString wanting
                ++ "', but received value '"
                ++ toString received
                ++ "'."
