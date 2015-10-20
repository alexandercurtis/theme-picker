module Main where

import ThemePicker
import Html exposing (..)


-- MODEL

type alias Model =
  { theme : String
  , themePicker : ThemePicker.Model }


initialModel : Model
initialModel = { theme = "Summer", themePicker = ThemePicker.initialModel }


-- UPDATE

type Action = NoOp
            | ThemePickerAction ThemePicker.Action
-- TODO: Extend with more Main.Action values


update : Action -> Model -> Model
update action model =
  case action of
    ThemePickerAction themePickerAction ->
      let
        newModel = case themePickerAction of
                  ThemePicker.ItemSelected item ->
                    { model | theme <- (ThemePicker.optionIdToSeason (.id item)) }
                  _ -> model
        m = ThemePicker.update themePickerAction newModel.themePicker
      in
        { newModel | themePicker <- m }


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div [ ] [ h1 [ ] [ text ("Today's theme is " ++ model.theme)]
          , ThemePicker.view (Signal.forwardTo address ThemePickerAction) model.themePicker
          ]


-- WIRING IT TOGETHER


inbox : Signal.Mailbox Action
inbox =
  Signal.mailbox NoOp


actions : Signal Action
actions =
  inbox.signal


model : Signal Model
model =
  Signal.foldp update initialModel actions


main : Signal Html
main =
  Signal.map (view inbox.address) model
