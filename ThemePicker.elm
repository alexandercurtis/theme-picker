module ThemePicker where

import Html exposing (..)
import Html.Events exposing (..)


type alias Model =
  { itemWasSelected : Bool }

type alias Item = {id: Int, value: String}

initialModel : Model
initialModel = { itemWasSelected = False }


type Action
  = ItemSelected Item
  | OnFocus
  | OnBlur


update : Action -> Model -> Model
update action model =
  case action of
<<<<<<< HEAD
    ItemSelected i -> { model | itemWasSelected <- True }
=======
    ItemSelected i -> model
    OnFocus -> model
    OnBlur -> model
>>>>>>> Works but Main.elm needs to know a lot about internals of ThemePicker


view : Signal.Address Action -> Model -> Html
view address model =
  div [ ] [ if
              model.itemWasSelected == True
            then
              p [ ] [ text "Theme selected!"]
            else
              text "" -- TODO: Is there something like Html.Nothing to use here?
          , button
              [ onClick address (ItemSelected (Item 2 "Winter2")) ]
              [ text "Set theme to Winter" ]
          ]
