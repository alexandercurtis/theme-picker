module ThemePicker where

import Html exposing (..)
import Html.Events exposing (..)


type alias Model =
  { itemWasSelected : Bool }


initialModel : Model
initialModel = { itemWasSelected = False }


type Action
  = ItemSelected String -- TODO: Replace String with ThemePicker specific type
-- TODO: extend with more actions


update : Action -> Model -> Model
update action model =
  case action of
    ItemSelected i -> { model | itemWasSelected <- True }


view : Signal.Address Action -> Model -> Html
view address model =
  div [ ] [ if
              model.itemWasSelected == True
            then
              p [ ] [ text "Theme selected!"]
            else
              text "" -- TODO: Is there something like Html.Nothing to use here?
          , button
              [ onClick address (ItemSelected "Winter") ]
              [ text "Set theme to Winter" ]
          ]
