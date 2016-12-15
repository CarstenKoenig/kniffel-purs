module Main where

import Prelude
import Pux.Html as H
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import Pux (CoreEffects, renderToDOM, fromSimple, start)
import Pux.Html (Html)


type AppEffects = (console :: CONSOLE)

data Action
    = NoAction

type State = Int

update :: Action -> State -> State
update NoAction state = state


view :: State -> Html Action
view state =
  H.div
    []
    [ H.text "Hello Kniffel"
    ]


main :: Eff (CoreEffects AppEffects) Unit
main = do
  app <- start
    { initialState: 1
    , update: fromSimple update
    , view: view
    , inputs: []
    }

  renderToDOM "#app" app.html