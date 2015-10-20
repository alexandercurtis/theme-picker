module ThemePicker where

import Html exposing (..)
import Html.Events exposing (..)


type alias Model =
  { currentItem : Maybe OptionItem }

type alias OptionItem = {id: Int, enabled: Bool}

initialModel : Model
initialModel = { currentItem = Nothing }

optionIdToSeason : Int -> String
optionIdToSeason id =
  if id == 2 then "Winter" else "Autumn"

type Action
  = ItemSelected OptionItem
  | OnFocus
  | OnBlur

update : Action -> Model -> Model
update action model =
  case action of
    ItemSelected item -> { model | currentItem <- Just item }
    OnFocus -> model
    OnBlur -> model


view : Signal.Address Action -> Model -> Html
view address model =
  div [ ] [ case model.currentItem of
              Just item ->
                p [ ] [ text "Button was pressed!"]
              Nothing ->
                text "" -- TODO: Is there something like Html.Nothing to use here?
          , button
              [ onClick address (ItemSelected (OptionItem 2 True)) ]
              [ text "Set theme to Winter" ]
          ]
