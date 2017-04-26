module Apps.LogViewer.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.CssHelpers
import Css exposing (asPairs)
import Css.Common exposing (elasticClass)
import Game.Models exposing (GameModel)
import Game.Servers.Filesystem.Models exposing (FilePath)
import Apps.Instances.Models as Instance exposing (InstanceID)
import Apps.Context as Context
import Apps.LogViewer.Messages exposing (Msg(..))
import Apps.LogViewer.Models exposing (Model, LogViewer, getState)
import Apps.LogViewer.Context.Models exposing (Context(..))
import Apps.LogViewer.Style exposing (Classes(..))


{ id, class, classList } =
    Html.CssHelpers.withNamespace "logvw"


styles : List Css.Mixin -> Attribute Msg
styles =
    Css.asPairs >> style


view : Model -> InstanceID -> GameModel -> Html Msg
view model id game =
    let
        logvw =
            getState model id
    in
        div []
            [ div [ class [ HeaderBar ] ]
                [ div [ class [ ETAct ] ]
                    [ span [ class [ BtnUser ] ] []
                    , text " "
                    , span [ class [ BtnEdit ] ] []
                    , text " "
                    , span [ class [ BtnView ] ] []
                    ]
                , div [ class [ ETFilter ] ]
                    [ div [ class [ BtnFilter ] ] []
                    , div [ class [ ETFBar ] ]
                        [ input [ placeholder "Search..." ] []
                        ]
                    ]
                ]
            , div [ class [ Entry ] ]
                [ div [ class [ ETop ] ]
                    [ div [] [ text "15/03/2016 - 20:24:33.105" ]
                    , div [ elasticClass ] []
                    , div [ class [ ETActMini ] ]
                        [ span [ class [ BtnEdit ] ] []
                        ]
                    ]
                , div [ class [ EData ] ]
                    [ span [ class [ IcoCrosshair ] ] []
                    , span [ class [ IdMe ] ] [ text "174.57.204.104" ]
                    , span [] [ text " logged in as " ]
                    , span [ class [ IcoUser ] ] []
                    , span [ class [ IdRoot ] ] [ text "root" ]
                    ]
                , div [ class [ EBottom ] ]
                    [ div [ elasticClass ] []
                    , div [ class [ CasedBtnExpand, EToggler ] ] []
                    ]
                ]
            , div [ class [ Entry ] ]
                [ div [ class [ ETop ] ]
                    [ div [] [ text "15/03/2016 - 20:24:33.105" ]
                    , div [ elasticClass ] []
                    , div []
                        [ span [ class [ BtnUser ] ] []
                        , text " "
                        , span [ class [ BtnEdit ] ] []
                        ]
                    ]
                , div [ class [ EData ] ]
                    [ span [ class [ IcoHome ] ] []
                    , span [ class [ IdLocal ] ] [ text "localhost" ]
                    , span [] [ text " bounced connection from " ]
                    , span [ class [ IcoCrosshair ] ] []
                    , span [ class [ IdMe ] ] [ text "174.57.204.104" ]
                    , span [] [ text " to " ]
                    , span [ class [ IcoDangerous ] ] []
                    , span [ class [ IdOther ] ] [ text "209.43.107.189" ]
                    ]
                , div [ class [ EBottom ] ]
                    [ div [ class [ EAct ] ]
                        [ span [ class [ IcoUser ] ] []
                        , text " "
                        , span [ class [ BtnView ] ] []
                        , text " "
                        , span [ class [ BtnEdit ] ] []
                        , text " "
                        , span [ class [ BtnDelete ] ] []
                        ]
                    , div [ class [ CasedBtnExpand, EToggler ] ] []
                    ]
                ]
            , div [ class [ Entry ] ]
                [ div [ class [ ETop ] ]
                    [ div [ elasticClass ] []
                    , div [ class [ ETActMini ] ]
                        [ span [ class [ BtnLock ] ] []
                        ]
                    ]
                , div [ class [ EBottom ] ]
                    [ div [ elasticClass ] []
                    , div [ class [ CasedBtnExpand, EToggler ] ] []
                    ]
                ]
            , div [ class [ Entry ] ]
                [ div [ class [ ETop ] ]
                    [ div [ elasticClass ] []
                    , div [ class [ ETActMini ] ]
                        [ span [ class [ BtnLock ] ] []
                        ]
                    ]
                , div [ class [ EBottom ] ]
                    [ div [ class [ EAct ] ]
                        [ span [ class [ BtnView ] ] []
                        , text " "
                        , span [ class [ BtnUnlock ] ] []
                        ]
                    ]
                ]
            , div [ class [ Entry ] ]
                [ div [ class [ ETop ] ] [ text "15/03/2016 - 20:24:33.105" ]
                , div [ class [ EData ] ]
                    [ span [] [ text "NOTME" ]
                    , span [] [ text " logged in as " ]
                    , span [ class [ IcoUser ] ] []
                    , span [] [ text "root" ]
                    ]
                , div [ class [ EBottom ] ]
                    [ div [ class [ EAct ] ]
                        [ span [ class [ BtnApply ] ] []
                        , text " "
                        , span [ class [ BtnCancel ] ] []
                        ]
                    ]
                ]
            ]
