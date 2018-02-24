import Html exposing (button, Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Html.Events exposing (onClick)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { content : String,
  number : Int }

model : Model
model =
  { content = "",
  number = 0 }


-- UPDATE

type Msg
  = Change String | Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }
      
    Increment ->
       { model | number =  model.number + 1 }

    Decrement ->
       { model | number =  model.number - 1 }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    , button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.number) ]
    , button [ onClick Increment ] [ text "+" ]
    ]