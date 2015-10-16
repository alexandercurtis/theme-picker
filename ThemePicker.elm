module ThemePicker where


import Html exposing (..)
import Html.Events exposing (..)

type alias Model =
  { buttonWasPressed : Bool }

initialModel : Model
initialModel = { buttonWasPressed = False }


type Action
  = ItemSelected String -- TODO: Replace String with ThemePicker specific type
-- TODO: extend with more actions

update : Action -> Model -> Model
update action model =
  case action of
    ItemSelected i -> model

view : Signal.Address Action -> Model -> Html
view address model =
  div [ ] [ if
              model.buttonWasPressed == True
            then
              p [ ] [ text "Button was pressed!"]
            else
              text "" -- TODO: Is there something like Html.Nothing to use here?
          , button
              [ onClick address (ItemSelected "Winter") ]
              [ text "Set theme to Winter" ]
          ]
